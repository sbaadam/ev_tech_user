import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ev_tech_user/Screens/Profile/Model/kyc_model.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:ev_tech_user/services/network.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class KycProvider with ChangeNotifier {
  AdharKycModel adharKycModel = AdharKycModel();
  PanKycModel panKycModel = PanKycModel();
  DrivingKycModel drivingKycModel = DrivingKycModel();
  RcKycModel rcKycModel = RcKycModel();
  TextEditingController adharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController drivingController = TextEditingController();
  String adharFront = '';
  String adharBack = '';
  String panFront = '';
  String panBack = '';
  String drivingFront = '';
  String drivingBack = '';
  String rcFront = '';
  String rcBack = '';
  bool isUpdateKyc = false;

  void setUpdateKyc(bool value) async {
    isUpdateKyc = value;
    notifyListeners();
  }

  Future<void> getKycApi(BuildContext context) async {
    final String authToken = GlobalVariables.authToken ?? '';

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context, "${ApiConstant.getAdharKycDocuments}a", headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});
      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final Map<String, dynamic> res = response!.data;

      if (res['status'] != true) {
        //showToast(res['message'] ?? 'Data not loaded ❌');
        return;
      }
      adharKycModel = AdharKycModel.fromJson(res);
      setUpdateKyc(false);
    } catch (e, stack) {
      debugPrint("getKycApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      notifyListeners();
    }
  }

  Future<void> getPanKycApi(BuildContext context) async {
    final String authToken = GlobalVariables.authToken ?? '';

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      //EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context, "${ApiConstant.getAdharKycDocuments}p", headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});
      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final Map<String, dynamic> res = response!.data;

      if (res['status'] != true) {
        //showToast(res['message'] ?? 'Data not loaded ❌');
        return;
      }
      panKycModel = PanKycModel.fromJson(res);
      setUpdateKyc(false);
    } catch (e, stack) {
      debugPrint("getKycApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      notifyListeners();
    }
  }

  Future<void> getDVKycApi(BuildContext context) async {
    final String authToken = GlobalVariables.authToken ?? '';

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      //EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context, "${ApiConstant.getAdharKycDocuments}d", headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});
      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final Map<String, dynamic> res = response!.data;

      if (res['status'] != true) {
        //showToast(res['message'] ?? 'Data not loaded ❌');
        return;
      }
      drivingKycModel = DrivingKycModel.fromJson(res);
      setUpdateKyc(false);
    } catch (e, stack) {
      debugPrint("getKycApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      notifyListeners();
    }
  }

  Future<void> getRCKycApi(BuildContext context) async {
    final String authToken = GlobalVariables.authToken ?? '';

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      //EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context, "${ApiConstant.getAdharKycDocuments}r", headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});
      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final Map<String, dynamic> res = response!.data;

      if (res['status'] != true) {
        //showToast(res['message'] ?? 'Data not loaded ❌');
        return;
      }
      rcKycModel = RcKycModel.fromJson(res);
      setUpdateKyc(false);
    } catch (e, stack) {
      debugPrint("getKycApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

  File? pickedImageFile;

  Future<void> pickAndCropImage(BuildContext context, String docType, String docTypeFull) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(sourcePath: pickedFile.path, aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1), uiSettings: [AndroidUiSettings(toolbarTitle: 'Crop Image', toolbarColor: Colors.blue, toolbarWidgetColor: Colors.white, hideBottomControls: false, lockAspectRatio: false), IOSUiSettings(title: 'Crop Image', aspectRatioLockEnabled: false)]);

      if (croppedFile != null) {
        pickedImageFile = File(croppedFile.path);
        uploadImage(context, docType, docTypeFull);
        notifyListeners();
      }
    }
  }

  Future<void> uploadImage(BuildContext context, String docType, String docTypeFull) async {
    final networkProvider = NetworkProvider();
    final String authToken = GlobalVariables.authToken ?? '';

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      String fileName = pickedImageFile!.path.split('/').last;
      final body = FormData.fromMap({'image': await MultipartFile.fromFile(pickedImageFile!.path, filename: fileName), 'prefix': docType});

      EasyLoading.show(status: 'Updating image...');

      final response = await networkProvider.postRequestWithFile(context, ApiConstant.fileUpload, body: body, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            if (docTypeFull == "${StringsConstant.strAadharCard}Front") {
              adharFront = data['file_path'];
              setUpdateKyc(true);
            } else if (docTypeFull == "${StringsConstant.strAadharCard}Back") {
              adharBack = data['file_path'];
              setUpdateKyc(true);
            } else if (docTypeFull == "${StringsConstant.strPANCard}Front") {
              panFront = data['file_path'];
              setUpdateKyc(true);
            } else if (docTypeFull == "${StringsConstant.strPANCard}Back") {
              panBack = data['file_path'];
              setUpdateKyc(true);
            } else if (docTypeFull == "${StringsConstant.strDrivingLicence}Front") {
              drivingFront = data['file_path'];
              setUpdateKyc(true);
            } else if (docTypeFull == "${StringsConstant.strDrivingLicence}Back") {
              drivingBack = data['file_path'];
              setUpdateKyc(true);
            } else if (docTypeFull == "${StringsConstant.strRCBook}Front") {
              rcFront = data['file_path'];
              setUpdateKyc(true);
            } else if (docTypeFull == "${StringsConstant.strRCBook}Back") {
              rcBack = data['file_path'];
              setUpdateKyc(true);
            }
          } else {
            showToast("❌ ${data['message'] ?? 'Image upload failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
      debugPrint("Image upload Error: $e");
    } finally {
      pickedImageFile = null;
      notifyListeners();
    }
  }

  Future<void> storeKycApi(BuildContext context, String documentType) async {
    final networkProvider = NetworkProvider();

    final String authToken = GlobalVariables.authToken ?? "";

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }
    try {
      final body = {
        'document_type': documentType,
        'document_number':
            documentType == StringsConstant.strAadharCard
                ? adharController.text.trim()
                : documentType == StringsConstant.strPANCard
                ? panController.text.trim()
                : documentType == StringsConstant.strDrivingLicence
                ? drivingController.text.trim()
                : '',
        'document_front':
            documentType == StringsConstant.strAadharCard
                ? adharFront
                : documentType == StringsConstant.strPANCard
                ? panFront
                : documentType == StringsConstant.strDrivingLicence
                ? drivingFront
                : rcFront,
        'document_back':
            documentType == StringsConstant.strAadharCard
                ? adharBack
                : documentType == StringsConstant.strPANCard
                ? panBack
                : documentType == StringsConstant.strDrivingLicence
                ? drivingBack
                : rcBack,
      };

      EasyLoading.show(status: 'Uploding...');
      print(body);
      final response = await networkProvider.postRequest(context, ApiConstant.storeKycDocuments, body: body, headers: {'Authorization': 'Bearer $authToken'});

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            Future.delayed(const Duration(milliseconds: 300), () {
              showToast("✅ ${data['message'] ?? 'Store Kyc successfully'}");
              Navigator.pop(context);
            });
          } else {
            showToast("❌ ${data['message'] ?? 'Store Kyc failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
    } finally {
      documentType == StringsConstant.strAadharCard
          ? getKycApi(context)
          : documentType == StringsConstant.strPANCard
          ? getPanKycApi(context)
          : documentType == StringsConstant.strDrivingLicence
          ? getDVKycApi(context)
          : getRCKycApi(context);
      notifyListeners();
    }
  }

  void setAdharKyc() async {
    adharController.text = adharKycModel.data?.documentNumber ?? '';
    adharFront = adharKycModel.data?.documentFront ?? '';
    adharBack = adharKycModel.data?.documentBack ?? '';
    panController.clear();
    drivingController.clear();
    panFront = '';
    panBack = '';
    drivingFront = '';
    drivingBack = '';
    rcFront = '';
    rcBack = '';
    notifyListeners();
  }
  void setPanKyc() async {
    adharController.text = '';
    adharFront = '';
    adharBack = '';
panController.text = panKycModel.data?.documentNumber ?? '';
    panFront = panKycModel.data?.documentFront ?? '';
    panBack = panKycModel.data?.documentBack ?? '';
    drivingController.text = '';
    drivingFront = '';
    drivingBack = '';
    rcFront = '';
    rcBack = '';
    notifyListeners();
  }
  void setDrivingKyc() async {
    adharController.text = '';
    adharFront = '';
    adharBack = '';

    panController.text = '';
    panFront = '';
    panBack = '';
    drivingController.text = drivingKycModel.data?.documentNumber ?? '';
    drivingFront = drivingKycModel.data?.documentFront ?? '';
    drivingBack = drivingKycModel.data?.documentBack ?? '';
    rcFront = '';
    rcBack = '';
    notifyListeners();
  }
  void setRcKyc() async {
    adharController.text = '';
    adharFront = '';
    adharBack = '';

    panController.text = '';
    panFront = '';
    panBack = '';
    drivingController.text = '';
    drivingFront = '';
    drivingBack = '';
    rcFront = drivingKycModel.data?.documentFront ?? '';
    rcBack = drivingKycModel.data?.documentBack ?? '';
    notifyListeners();
  }
}

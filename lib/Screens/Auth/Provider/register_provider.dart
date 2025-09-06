import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Screens/Home/navbar_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:ev_tech_user/services/network.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RegisterProvider with ChangeNotifier {
  String userImage='';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController vYearController = TextEditingController();

  Future<void> registerApi(BuildContext context) async {
    final networkProvider = NetworkProvider();

    // API body
    try {
      final body = {'name': nameController.text.trim(), 'mobile': mobileController.text.trim(), 'email': emailController.text.trim(), 'password': passController.text.trim(), 'role': 'user', 'vehicle_name': vehicleNameController.text.trim(), 'vehicle_number': vehicleNoController.text.trim(), 'vehicle_model': modelController.text.trim(), 'vehicle_year': vYearController.text.trim(), 'fcm_token': fcmTokenString};

      EasyLoading.show(status: 'Registering...');

      final response = await networkProvider.postRequest(context, ApiConstant.register, body: body);

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            showToast("✅ ${data['message'] ?? 'Registered successfully'}");
            await GlobalVariables.setToken(data['token']);
            debugPrint("🔑 Token set: ${data['token']}");
            await GlobalVariables.setRole(data['role'].toString());
            clearAll();
            if (context.mounted) {
              newNextScreenAndRemoveUntilPage(context, NavScreen());
            }
          } else {
            showToast("❌ ${data['message'] ?? 'Registration failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
    }
  }


  ///update
  File? pickedImageFile;
  Future<void> pickAndCropImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1), // Square crop
        uiSettings: [
          AndroidUiSettings(toolbarTitle: 'Crop Image', toolbarColor: AppTheme.greenColor, toolbarWidgetColor: Colors.white, hideBottomControls: false, lockAspectRatio: false),
          IOSUiSettings(title: 'Crop Image', aspectRatioLockEnabled: false),
        ],
      );

      if (croppedFile != null) {
        pickedImageFile = File(croppedFile.path);
        await uploadImage(context);
        notifyListeners();
      }
    }
  }
  Future<void> setProfile(String value)async{
    userImage=value;
    notifyListeners();
  }
  Future<void> uploadImage(BuildContext context) async {
    final networkProvider = NetworkProvider();

    final String authToken = GlobalVariables.authToken ?? "";

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      String fileName = pickedImageFile!.path.split('/').last;
      final body = FormData.fromMap({'image': await MultipartFile.fromFile(pickedImageFile!.path, filename: fileName), 'prefix': 'ProfilePhoto'});

      EasyLoading.show(status: 'Updating image...');

      final response = await networkProvider.postRequestWithFile(context,ApiConstant.fileUpload, body: body, headers: {'Authorization': 'Bearer $authToken'});

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            print("https://evtech24.com/${data['file_path']}");
            userImage = "${data['file_path']}";
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
      pickedImageFile=null;
      notifyListeners();
    }
  }

  Future<void> updateApi(BuildContext context) async {
    final networkProvider = NetworkProvider();

    final String authToken = GlobalVariables.authToken ?? "";

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }
    // API body
    try {
      final body = {
        'name': nameController.text,
        'profile_photo': userImage,
        'vehicle_name':vehicleNameController.text,
        'vehicle_number': vehicleNoController.text,
        'vehicle_model': modelController.text,
        'vehicle_year': vYearController.text.trim()
      };

      EasyLoading.show(status: 'Updating...');

      final response = await networkProvider.postRequest(context,ApiConstant.updateProfile, body: body, headers: {'Authorization': 'Bearer $authToken'});

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            showToast("✅ ${data['message'] ?? 'Update successfully'}");
            final userProvider = Provider.of<UserProvider>(context, listen: false);
            userProvider.getProfileApi(context);
            if (context.mounted) {
              Navigator.pop(context);
            }
          } else {
            showToast("❌ ${data['message'] ?? 'Update failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
    } finally {
      clearAll();
      notifyListeners();
    }
  }

  void clearAll() {
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    passController.clear();
    conPassController.clear();
    vehicleNoController.clear();
    modelController.clear();
    vYearController.clear();
    notifyListeners();
  }
}

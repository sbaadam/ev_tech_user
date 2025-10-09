import 'package:ev_tech_user/Screens/Address/Model/get_address_model.dart';
import 'package:ev_tech_user/Screens/Coupon/model/get_coupan_model.dart';
import 'package:ev_tech_user/Screens/Home/Model/category_model.dart';
import 'package:ev_tech_user/Screens/Home/Model/city_model.dart';
import 'package:ev_tech_user/Screens/Home/Model/state_model.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/model/service_details_model.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/model/service_list_model.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/thank_you_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:ev_tech_user/services/network.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeProvider with ChangeNotifier {
  String selectCateId = '';
  String selectDate = '';
  String selectTime = '';
  CategorysModel categoriesModel = CategorysModel();
  ServiceListModel serviceListModel = ServiceListModel();
  ServiceDetailsModel serviceDetailsModel = ServiceDetailsModel();
  ServicesData servicesData = ServicesData();

  setServiceId(ServicesData id) {
    servicesData = id;
    notifyListeners();
  }

  setCateId(String id) {
    selectCateId = id;
    notifyListeners();
  }

  setDate(String id) {
    selectDate = id;
    notifyListeners();
  }

  setTime(String id) {
    selectTime = id;
    notifyListeners();
  }

  Future<void> getCategoriesApi(BuildContext context) async {
    categoriesModel = CategorysModel();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context, ApiConstant.getCategories, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {
        categoriesModel = CategorysModel.fromJson(res);
      } else {
        showToast(res['message'] ?? 'Data not loaded');
      }
    } catch (e, stack) {
      debugPrint("getProfileApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

  Future<void> getServiceApi(BuildContext context) async {
    serviceListModel = ServiceListModel();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context, "${ApiConstant.getServices}$selectCateId&service_id=", headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {
        serviceListModel = ServiceListModel.fromJson(res);
      } else {
        showToast(res['message'] ?? 'Data not loaded');
      }
    } catch (e, stack) {
      debugPrint("getProfileApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

  Future<void> getServiceDetailsApi(BuildContext context) async {
    serviceDetailsModel = ServiceDetailsModel();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context, "${ApiConstant.getServices}$selectCateId&service_id=${servicesData.id}", headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {
        serviceDetailsModel = ServiceDetailsModel.fromJson(res);
      } else {
        showToast(res['message'] ?? 'Data not loaded');
      }
    } catch (e, stack) {
      debugPrint("getProfileApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

  ///address
  GetAddressModel getAddressModel = GetAddressModel();
  AddressData selectAddress = AddressData();
  String editId='';
  TextEditingController nameCon = TextEditingController();
  TextEditingController mobileCon = TextEditingController();
  TextEditingController latCon = TextEditingController();
  TextEditingController longCon = TextEditingController();
  TextEditingController addressCon = TextEditingController();
  TextEditingController pincodeCon = TextEditingController();
  TextEditingController noteCon = TextEditingController();
  String selectAddressType = '';

  setAddress(AddressData value) {
    selectAddress = value;
    notifyListeners();
  }

  setAddressType(String value) {
    selectAddressType = value;
    notifyListeners();
  }

  Future<void> getAddressApi(BuildContext context) async {
    getAddressModel = GetAddressModel();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context, ApiConstant.getAddress, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {
        getAddressModel = GetAddressModel.fromJson(res);
      } else {
        showToast(res['message'] ?? 'Data not loaded');
      }
    } catch (e, stack) {
      debugPrint("getProfileApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

  StateModel stateModel = StateModel();
  List<String> stateList=[];
  List<String> stateListId=[];
  String selectState='';
  String selectStateId='';
  CityModel cityModel = CityModel();

  List<String> cityList=[];
  List<String> cityListId=[];
  String selectCity='';
  String selectCityId='';

  setState(String name,BuildContext context){
    selectState=name;
    selectStateId=stateListId[stateList.indexOf(name)];
    notifyListeners();
    getCityApi(context);
  }

  setCity(String name){
    selectCity=name;
    selectCityId=cityListId[cityList.indexOf(name)];
    notifyListeners();
  }

  Future<void> getStateApi(BuildContext context, {int? preSelectedStateId}) async {
    stateModel = StateModel();
    stateList.clear();
    stateListId.clear();
    try {
      EasyLoading.show(status: 'Please wait...');
      final response = await NetworkProvider().getRequest(
        context,
        ApiConstant.getState,
        headers: {'Content-Type': 'application/json'},
      );

      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final res = response!.data;
      if (res['status'] == true) {
        stateModel = StateModel.fromJson(res);
        for (var each in stateModel.data!) {
          stateList.add(each.name ?? "");
          stateListId.add(each.id.toString());
        }

        if (preSelectedStateId != null) {
          int index = stateListId.indexOf(preSelectedStateId.toString());
          if (index != -1) {
            selectState = stateList[index];
            selectStateId = stateListId[index];
          } else {
            selectState = stateList.first;
            selectStateId = stateListId.first;
          }
        } else {
          selectState = stateList.first;
          selectStateId = stateListId.first;
        }
      }
      else {
        showToast(res['message'] ?? 'Data not loaded');
      }
    } catch (e, stack) {
      debugPrint("getStateApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

  // Get City API
  Future<void> getCityApi(BuildContext context, {int? preSelectedCityId}) async {
    cityModel = CityModel();
    cityList.clear();
    cityListId.clear();
    if (selectStateId == '') return;

    try {
      EasyLoading.show(status: 'Please wait...');
      final response = await NetworkProvider().getRequest(
        context,
        "${ApiConstant.getCity}$selectStateId",
        headers: {'Content-Type': 'application/json'},
      );

      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {
        cityModel = CityModel.fromJson(res);
        for(var each in cityModel.data!){
          cityList.add(each.name??"");
          cityListId.add(each.id.toString());
        }
        if (preSelectedCityId != null) {
          int index = cityListId.indexOf(preSelectedCityId.toString());
          if (index != -1) {
            selectCity = cityList[index];
            selectCityId = cityListId[index];
          } else {
            selectCity = cityList.first;
            selectCityId = cityListId.first;
          }
        } else {
          selectCity = cityList.first;
          selectCityId = cityListId.first;
        }
      } else {
        showToast(res['message'] ?? 'Data not loaded');
      }
    } catch (e, stack) {
      debugPrint("getCityApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    try {
      // Show loading
      EasyLoading.show(status: 'Fetching location...');

      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        showToast("Location services are disabled ❌");
        return;
      }

      // Check permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          showToast("Location permissions are denied ❌");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        showToast("Location permissions are permanently denied ❌");
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // Store LatLong
      latCon.text = "${position.latitude}";
      longCon.text = "${position.longitude}";

      // Convert to address
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        addressCon.text = "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      }

      // Notify UI
      notifyListeners();
    } catch (e, stack) {
      debugPrint("getCurrentLocation error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      // Dismiss loading
      EasyLoading.dismiss();
    }
  }

  Future<void> addAddressApi(BuildContext context) async {
    final networkProvider = NetworkProvider();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }
    // API body
    try {
      final body = {'name': nameCon.text.trim(), 'mobile': mobileCon.text, 'address': addressCon.text, 'city_id': selectCityId, 'state_id': selectStateId, 'country_id': '101', 'pincode': pincodeCon.text.trim(), 'latitude': latCon.text.trim(), 'longitude': longCon.text.trim(), 'address_type': selectAddressType};

      EasyLoading.show(status: 'Add Address...');

      final response = await networkProvider.postRequest(context, "${ApiConstant.storeAddress}$editId", body: body, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            Navigator.pop(context);
            showToast("✅ ${data['message']}");
          } else {
            showToast("❌ ${data['message'] ?? 'Add address failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
    } finally {
      getAddressApi(context);
      nameCon.text = '';
      mobileCon.text = '';
      addressCon.text = '';
      selectCity='';
      selectState='';
      stateList.clear();
      cityList.clear();
      pincodeCon.text = '';
      latCon.text = '';
      longCon.text = '';
      selectAddressType = '';
    }
  }
  initAddress(bool isEdit,AddressData addressData,BuildContext context) async {
    selectCity='';
    selectState='';
    stateList.clear();
    cityList.clear();
    if (isEdit) {
      editId = addressData.id.toString();
      nameCon.text = addressData.name ?? '';
      mobileCon.text = addressData.mobile ?? '';
      latCon.text = addressData.latitude ?? '';
      longCon.text = addressData.longitude ?? '';
      addressCon.text = addressData.address ?? '';
      pincodeCon.text = addressData.pincode ?? '';
      selectAddressType = addressData.addressType ?? '';

      await getStateApi(context,preSelectedStateId: int.parse(addressData.stateId??'0'));
      await getCityApi(context,preSelectedCityId: int.parse(addressData.cityId??'0'));
      //selectedCity=CityData(id: addressData.city?.id,name: addressData.city?.name,stateId: addressData.city?.stateId);
      notifyListeners();
    } else {
      await getStateApi(context);
    }
  }
  ///coupon

  GetCouponModel getCouponModel = GetCouponModel();
  Coupons selectCoupon = Coupons();

  setCoupon(Coupons value) {
    selectCoupon = value;
    notifyListeners();
  }

  removeCoupon() {
    selectCoupon = Coupons();
    notifyListeners();
  }

  Future<void> getCouponApi(BuildContext context) async {
    getCouponModel = GetCouponModel();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context, "${ApiConstant.getValidCoupon}${servicesData.id}", headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {
        getCouponModel = GetCouponModel.fromJson(res);
      } else {
        showToast(res['message'] ?? 'Data not loaded');
      }
    } catch (e, stack) {
      debugPrint("getProfileApi error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }
  void openScreenAndRemovePrevious5(BuildContext context, Widget screen) {
    int count = 0;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
          (route) {
        count++;
        return count > 4;
      },
    );
  }
  Future<void> storeBookingApi(BuildContext context) async {
    final networkProvider = NetworkProvider();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }
    // API body
    try {
      final body = {
        'service_id': servicesData.id.toString(),
        'address_id': selectAddress.id.toString(),
        'latitude': latCon.text.trim(),
        'longitude': longCon.text.trim(),
        'notes': noteCon.text.trim(),
        'coupon_code_id': '',
        'coupon_applied_amount': '',
        'date': selectDate,
        'time': selectTime,
        'cgst_amount': ((double.tryParse(servicesData.price.toString()) ?? 0) * 5 / 100).toString(),
        'sgst_amount': ((double.tryParse(servicesData.price.toString()) ?? 0) * 5 / 100).toString(),
        'grand_total': ((double.tryParse(servicesData.price?.toString() ?? '') ?? 0) * 1.10).toStringAsFixed(2),
        'reference_id': '2132dsvdfv123sdfsd',
        'payment_response': '123dw4e2ewvgrwe',
      };

      EasyLoading.show(status: 'Booking...');

      final response = await networkProvider.postRequest(context, ApiConstant.serviceBooking, body: body, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {

            openScreenAndRemovePrevious5(
              context,
              ThankYouScreen(id: data['booking']['id'].toString()),
            );

          } else {
            showToast("❌ ${data['message'] ?? 'Add address failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
    } finally {
      servicesData = ServicesData();
      selectAddress = AddressData();
      latCon.text = '';
      longCon.text = '';
      noteCon.text = '';
      selectDate = '';
      selectTime = '';
    }
  }

  Future<void> deleteAddressApi(BuildContext context,String id) async {
    final networkProvider = NetworkProvider();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }
    // API body
    try {

      EasyLoading.show(status: 'Deleting...');

      final response = await networkProvider.deleteRequest(context, '${ApiConstant.deleteAddress}$id', headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
           showToast("${data['message'] ?? 'delete address failed'}");
           getAddressApi(context);
          } else {
            showToast("❌ ${data['message'] ?? 'delete address failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
    } finally {
     notifyListeners();
    }
  }
}

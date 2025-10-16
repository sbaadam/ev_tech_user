import 'package:ev_tech_user/Screens/Auth/login_screen.dart';
import 'package:ev_tech_user/Screens/Home/Model/user_model.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:ev_tech_user/services/network.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UserProvider with ChangeNotifier {
  UserModel userModel = UserModel();

  Future<void> getProfileApi() async {
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequestWithoutContext(ApiConstant.getUserDetails, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {
        userModel = UserModel.fromJson(res);
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


  Future<void> logoutApi(BuildContext context) async {
    final String authToken = GlobalVariables.authToken ?? "";

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().postRequest(context,ApiConstant.logout, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      if (response?.data == null) {
        showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {
        showToast(res['message'] ?? 'Logout Successfully');
        newNextScreenAndRemoveUntilPage(context, LoginScreen());
        GlobalVariables.clearAll();

      } else {
        showToast(res['message'] ?? 'Logout Fail');
      }
    } catch (e, stack) {
      debugPrint("Logout Fail error: $e");
      debugPrint(stack.toString());
      showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }


}

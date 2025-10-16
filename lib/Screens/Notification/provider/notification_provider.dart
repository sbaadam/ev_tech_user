
import 'package:ev_tech_user/Screens/Notification/Model/notification_model.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:ev_tech_user/services/network.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NotificationGetProvider with ChangeNotifier {
  NotificationModel getNotificationModel=NotificationModel();

  Future<void> getNotificationApi(BuildContext context) async {
    final String authToken = GlobalVariables.authToken ?? "";

    if (authToken.isEmpty) {
      EasyLoading.showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().getRequest(context,ApiConstant.getNotification, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      if (response?.data == null) {
        EasyLoading.showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {
        getNotificationModel=NotificationModel.fromJson(res);

      } else {
        EasyLoading.showToast(res['message'] ?? 'Data not loaded');
      }
    } catch (e, stack) {
      debugPrint("getProfileApi error: $e");
      debugPrint(stack.toString());
      EasyLoading.showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      notifyListeners();
    }
  }
  Future<void> getNotificationDeleteApi(BuildContext context) async {
    final String authToken = GlobalVariables.authToken ?? "";

    if (authToken.isEmpty) {
      EasyLoading.showToast("Auth token missing ❌");
      return;
    }

    try {
      EasyLoading.show(status: 'Please wait...');

      final response = await NetworkProvider().deleteRequest(context,ApiConstant.deleteNotification, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      if (response?.data == null) {
        EasyLoading.showToast("No response from server ❌");
        return;
      }

      final res = response!.data;

      if (res['status'] == true) {

      } else {
        EasyLoading.showToast(res['message'] ?? 'Data not loaded');
      }
    } catch (e, stack) {
      debugPrint("getProfileApi error: $e");
      debugPrint(stack.toString());
      EasyLoading.showToast('Something went wrong ❌');
    } finally {
      EasyLoading.dismiss();
      getNotificationApi(context);
    }
  }

}
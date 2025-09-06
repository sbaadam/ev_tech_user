import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:ev_tech_user/services/network.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ChangePasswordProvider with ChangeNotifier {
  TextEditingController oldPasswordController=TextEditingController();
  TextEditingController changePasswordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();

  Future<void> changePassword(BuildContext context) async {
    final networkProvider = NetworkProvider();
    final String authToken = GlobalVariables.authToken ?? "";

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }
    try {
      final body = {
        'current_password': oldPasswordController.text.trim(),
        'new_password': changePasswordController.text.trim()
      };

      EasyLoading.show(status: 'Updating password...');

      final response = await networkProvider.postRequest(
        context,
        ApiConstant.changePassword,
        body: body,
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            showToast("✅ ${data['message'] ?? 'Password updated successfully'}");
            debugPrint("🔑 Password changed successfully");
            clearPasswordFields();
            if (context.mounted) {
              Navigator.pop(context);
            }
          } else {
            showToast("❌ ${data['message'] ?? 'Password update failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
      debugPrint("Change Password Error: $e");
    }
  }

  void clearPasswordFields() {
    oldPasswordController.clear();
    changePasswordController.clear();
    confirmPasswordController.clear();
  }

}

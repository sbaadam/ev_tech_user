import 'package:ev_tech_user/Screens/Home/navbar_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:ev_tech_user/services/network.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  Future<void> loginApi(BuildContext context) async {
    final networkProvider = NetworkProvider();

    try {
      final body = {
        'mobile': phoneController.text.trim(),
        'password': passWordController.text.trim(),
        'fcm_token': fcmTokenString
      };

      EasyLoading.show(status: 'Login...');

      final response = await networkProvider.postRequest(context, ApiConstant.login, body: body);

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            showToast("✅ ${data['message'] ?? 'Login successfully'}");
            await GlobalVariables.setToken(data['token']);
            debugPrint("🔑 Token set: ${data['token']}");
            await GlobalVariables.setRole(data['role'].toString());
            passWordController.text = '';
            phoneController.text = '';
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
}

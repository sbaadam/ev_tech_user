import 'package:ev_tech_user/Screens/Auth/Provider/changepassword_provider.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final changeProvider=Provider.of<ChangePasswordProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text:StringsConstant.strChangePassword),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    CustomText(text: StringsConstant.strEnterYourOldPassword, fontSize: 14, fontWeight: AppTheme.fontLight),
                    SizedBox(height: 6),
                    CustomTextField(hintText: '',controller: changeProvider.oldPasswordController),
                    SizedBox(height: 15),
                    CustomText(text: StringsConstant.strEnterYourNewPassword, fontSize: 14, fontWeight: AppTheme.fontLight),
                    SizedBox(height: 6),
                    CustomTextField(hintText: '',isPassword: true,controller: changeProvider.changePasswordController),
                    SizedBox(height: 15),
                    CustomText(text: StringsConstant.strEnterYourConfirmPassword, fontSize: 14, fontWeight: AppTheme.fontLight),
                    SizedBox(height: 8),
                    CustomTextField(hintText: '',isPassword: true,controller: changeProvider.confirmPasswordController),
                    Spacer(),
                    ButtonWidget(text: StringsConstant.strContinue, onTap: (){
                      if(changeProvider.oldPasswordController.text.isEmpty){
                        showToast('Please enter old password');
                      }else if(changeProvider.changePasswordController.text.isEmpty){
                        showToast('Please enter new password');
                      }else if(changeProvider.confirmPasswordController.text.isEmpty){
                        showToast('Please enter confirm password');
                      }else{
                        changeProvider.changePassword(context);
                      }
                    },width: double.infinity),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

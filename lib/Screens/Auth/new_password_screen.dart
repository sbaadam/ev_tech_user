import 'package:ev_tech_user/Screens/Auth/login_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/appbar_widget.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      appBar: CustomAppBar(title:''),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(child: CustomText(text: 'Enter New Password', fontSize: 20, fontWeight: AppTheme.fontSemiBold,color: AppTheme.greenColor,textAlign: TextAlign.center)),
            SizedBox(height: 20),
            Center(child: CustomText(text: 'Please enter the New Password', fontSize: 16, fontWeight: AppTheme.fontRegular,color: AppTheme.colorGrey,textAlign: TextAlign.center)),
            SizedBox(height: 20),
            CustomText(text: 'Enter Your New Password', fontSize: 14, fontWeight: AppTheme.fontLight,color: AppTheme.whiteColor),
            const SizedBox(height: 8),
            CustomTextField(hintText: '123456'),
            SizedBox(height: 15),
            CustomText(text: 'Enter Your Confirm Password', fontSize: 14, fontWeight: AppTheme.fontLight,color: AppTheme.whiteColor),
            const SizedBox(height: 8),
            CustomTextField(hintText: 'Enter Your Confirm Password',isPassword: true),
            Spacer(),
            ButtonWidget(
              text: StringsConstant.strContinue,
              onTap: ()=>newNextScreen(context,LoginScreen()),
              width: double.infinity,
            ),
            Spacer(),
          ],
        ),
      )
    );
  }
}

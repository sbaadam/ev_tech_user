import 'package:ev_tech_user/Screens/Auth/Provider/login_provider.dart';
import 'package:ev_tech_user/Screens/Auth/varify_email_screen.dart';
import 'package:ev_tech_user/Screens/Home/navbar_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: Column(
        children: [
          Expanded(flex: 2,child: SvgPicture.asset('assets/svg/logo.svg')),
          Expanded(
            flex: 3,
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: AppTheme.appColorBox,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: StringsConstant.strLogIn, fontSize: 20, fontWeight: AppTheme.fontSemiBold,color: AppTheme.greenColor),
                      SizedBox(height: 20),
                      CustomText(text: StringsConstant.strEnterYourPhone, fontSize: 14, fontWeight: AppTheme.fontLight,color: AppTheme.whiteColor),
                      SizedBox(height: 8),
                      CustomTextField(hintText: StringsConstant.strEnterYourPhone,controller: provider.phoneController,keyboardType: TextInputType.number,maxLength: 10),
                      SizedBox(height: 15),
                      CustomText(text: StringsConstant.strEnterYourPassword, fontSize: 14, fontWeight: AppTheme.fontLight,color: AppTheme.whiteColor),
                      SizedBox(height: 8),
                      CustomTextField(hintText: StringsConstant.strEnterYourPassword,isPassword: true,controller: provider.passWordController),
                      SizedBox(height: 8),
                      GestureDetector(onTap: ()=>newNextScreen(context, VarifyEmailScreen(isReg: false)),child: Align(alignment: Alignment.topRight,child: CustomText(text: 'Forgot Password ?', fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor))),
                      SizedBox(height: 20),
                      ButtonWidget(text: StringsConstant.strLogIn, onTap: (){
                        if(provider.phoneController.text.isEmpty){
                          showToast("Please enter phone");
                        }else if(provider.passWordController.text.isEmpty){
                          showToast('Please enter password');
                        }else{
                          provider.loginApi(context);
                        }
                      },width: double.infinity),
                      SizedBox(height: 10),
                      BorderButton(text: StringsConstant.strRegister, onTap:()=>newNextScreen(context,VarifyEmailScreen(isReg: true))),
                      SizedBox(height: 8),
                    ],
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}

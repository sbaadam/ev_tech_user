import 'package:ev_tech_user/Screens/Auth/Provider/register_provider.dart';
import 'package:ev_tech_user/Screens/Auth/otp_varify_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/appbar_widget.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class VarifyEmailScreen extends StatefulWidget {
  bool isReg;
  VarifyEmailScreen({super.key,required this.isReg});

  @override
  State<VarifyEmailScreen> createState() => _VarifyEmailScreenState();
}

class _VarifyEmailScreenState extends State<VarifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    final registerProvider=Provider.of<RegisterProvider>(context);
    return Scaffold(
        backgroundColor: AppTheme.appColor,
        appBar: CustomAppBar(title: ''),
        body:Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(child: CustomText(text: StringsConstant.strPhoneVerification, fontSize: 20, fontWeight: AppTheme.fontSemiBold,color: AppTheme.greenColor)),
              SizedBox(height: 20),
              Center(child: CustomText(text: StringsConstant.strPleaseEmailVerificationCode, fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.colorGrey,textAlign: TextAlign.center)),
              SizedBox(height: 32),
              CustomText(text: StringsConstant.strEnterYourPhone, fontSize: 16, fontWeight: AppTheme.fontRegular,color: AppTheme.whiteColor),
              const SizedBox(height: 8),
              CustomTextField(hintText: StringsConstant.strEnterYourPhone,keyboardType: TextInputType.number,maxLength: 10,controller: registerProvider.mobileController),
              Spacer(),
              ButtonWidget(
                text: StringsConstant.strContinue,
                onTap: (){
                  if(registerProvider.mobileController.text.isEmpty){
                    showToast('Please enter mobile number');
                  }else{
                    newNextScreen(context,OtpVarifyScreen(isReg: widget.isReg));
                  }
                },
                width: double.infinity,
              ),
              Spacer(),
            ],
          ),
        )
    );
  }
}

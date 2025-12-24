import 'dart:async';

import 'package:ev_tech_user/Screens/Auth/new_password_screen.dart';
import 'package:ev_tech_user/Screens/Auth/registration_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/appbar_widget.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

class OtpVarifyScreen extends StatefulWidget {
  bool isReg;

  OtpVarifyScreen({super.key, required this.isReg});

  @override
  State<OtpVarifyScreen> createState() => _OtpVarifyScreenState();
}

class _OtpVarifyScreenState extends State<OtpVarifyScreen> {
  late Timer _timer;
  int _remainingSeconds = 90;

  String get _timerText {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(1, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: TextStyle(fontSize: 20, color: AppTheme.whiteColor),
      decoration: BoxDecoration(
        color: AppTheme.appColorBox,
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
    );
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      appBar: CustomAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(child: CustomText(text: StringsConstant.strOTPVerification, fontSize: 20, fontWeight: AppTheme.fontSemiBold, color: AppTheme.greenColor)),
            SizedBox(height: 20),
            Center(child: CustomText(text: StringsConstant.strPleaseVerificationCodeSentEmail, fontSize: 16, fontWeight: AppTheme.fontRegular, color: AppTheme.colorGrey, textAlign: TextAlign.center)),
              SizedBox(height: 20),
              Center(child: Pinput(length: 4, defaultPinTheme: defaultPinTheme, focusedPinTheme: defaultPinTheme.copyWith(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: AppTheme.greenColor))), submittedPinTheme: defaultPinTheme, showCursor: true)),
              const SizedBox(height: 18),
            Center(child: CustomText(text: _timerText, fontSize: 14, fontWeight: AppTheme.fontRegular)),
            SizedBox(height: 25),
            if (_remainingSeconds == 0) Center(child: CustomText(text: StringsConstant.strResendCode, fontSize: 16, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)),
            SizedBox(height: 25),
            ButtonWidget(
              text: StringsConstant.strContinue,
              onTap: () {
                if (widget.isReg) {
                  newNextScreen(context, RegistrationScreen());
                } else {
                  newNextScreen(context, CreatePasswordScreen());
                }
              },
              width: double.infinity,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

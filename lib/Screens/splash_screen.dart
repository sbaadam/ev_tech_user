import 'dart:async';

import 'package:ev_tech_user/Screens/Auth/login_screen.dart';
import 'package:ev_tech_user/Screens/Home/navbar_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      if (GlobalVariables.authToken == null || GlobalVariables.authToken == '') {
        newNextScreenAndRemoveUntilPage(context, LoginScreen());
      } else {
        newNextScreenAndRemoveUntilPage(context, NavScreen());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: Center(child: SvgPicture.asset('assets/svg/logo.svg')),
    );
  }
}

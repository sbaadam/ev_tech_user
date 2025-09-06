import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_theme.dart';
String fcmTokenString='';
void newNextScreen(context, page) {
  Navigator.of(context).push(
    PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
  );
}
void newNextScreenAndRemoveUntilPage(BuildContext context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
        (route) => false,
  );
}

void showToast(String text){
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: AppTheme.greenColor,
    textColor: Colors.black,
    fontSize: 18,
  );
}
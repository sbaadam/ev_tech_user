import 'package:ev_tech_user/Utils/hexCode.dart';
import 'package:flutter/material.dart';


class AppTheme {
  AppTheme._();

  /// Font
  static const FontWeight fontThin = FontWeight.w100;
  static const FontWeight fontExtraLight = FontWeight.w200;
  static const FontWeight fontLight = FontWeight.w300;
  static const FontWeight fontRegular = FontWeight.w400;
  static const FontWeight fontMedium = FontWeight.w500;
  static const FontWeight fontSemiBold = FontWeight.w600;
  static const FontWeight fontBold = FontWeight.w700;
  static const FontWeight fontExtraBold = FontWeight.w800;
  static const FontWeight fontBlack = FontWeight.w900;


  static Color colorFontRegular  = HexColor("#495057");


  /// Font Size

  static const double verySmall8 = 8;
  static const double verySmall = 10;
  static const double small = 12;
   static const double medium = 14;
   static const double medium16 = 16;
   static const double large = 18;
  static const double extraLarge = 22;

///Color
   static Color appColor = HexColor("#000000");
   static Color appColorBox = HexColorOp("#3A3939",opacity: 0.50);
   static Color appColorShade25 = HexColorOp("#928C8C",opacity: 0.25);
   static Color appColorShade70 = HexColorOp("#2F2D2D",opacity: 0.70);
   static Color whiteColor = HexColor("#FFFFFF");
   static Color redColor = HexColorOp('#FE2E00',opacity:0.90);
   static Color   greenColor = HexColor("#8CC63F");
   static Color greenColorDark = HexColorOp("#8CC63F",opacity:0.90);
   static Color greenColor40 = HexColorOp("#8CC63F",opacity: 0.40);
   static Color greenColor25 = HexColorOp("#8CC63F",opacity: 0.25);
   static Color greenColor15 = HexColorOp("#8CC63F",opacity: 0.15);
   static Color colorGrey = HexColor("#989898");
   static Color blueDark = HexColor("#016D9E");

}

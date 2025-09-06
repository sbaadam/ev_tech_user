import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}


class HexColorOp extends Color {
  HexColorOp(final String hexColor, {double opacity = 1.0})
      : super(_getColorFromHex(hexColor, opacity));

  static int _getColorFromHex(String hexColor, double opacity) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      int alpha = (opacity * 255).toInt(); // Convert 0.1 to 26 (hex: 1A)
      String alphaHex = alpha.toRadixString(16).padLeft(2, '0').toUpperCase();
      hexColor = alphaHex + hexColor;
    }

    return int.parse(hexColor, radix: 16);
  }
}
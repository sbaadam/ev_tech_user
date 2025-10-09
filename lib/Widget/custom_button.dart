
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  double? width;
  double? height;
  double? radius;

  ButtonWidget({super.key, required this.text, required this.onTap, this.width, this.height, this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 220,
        height: height ?? 45,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius ?? 18), color: AppTheme.greenColor, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 8)]),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(text, style: TextStyle(color: AppTheme.appColor, fontWeight: AppTheme.fontMedium, fontFamily: 'LexendDeca', fontSize: 16))),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  Color? txtColor;
  double? height;
  double? radius;
  Color? borderColor;

  BorderButton({super.key, required this.text, required this.onTap, this.txtColor, this.height, this.radius, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Container(width: 335, height: height??45, decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius??15),color: Colors.transparent, border: Border.all(color: borderColor ??  AppTheme.greenColor, width: 0.5)), alignment: Alignment.center, child: Text(text, style: TextStyle(fontFamily: 'LexendDeca', color: txtColor ??  AppTheme.greenColor, fontWeight: AppTheme.fontRegular, fontSize: 16))));
  }
}

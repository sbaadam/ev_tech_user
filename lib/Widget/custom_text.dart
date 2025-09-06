import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final int? maxLine;
  final TextAlign? textAlign;

  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    this.maxLine,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontFamily: 'LexendDeca',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppTheme.whiteColor,
          height: 1.3
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

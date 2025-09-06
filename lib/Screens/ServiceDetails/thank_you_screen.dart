import 'package:dotted_line/dotted_line.dart';
import 'package:ev_tech_user/Screens/BookingList/booking_list_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';


class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: Column(
        children: [
          Spacer(),
          Column  (
            children: [
              Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppTheme.greenColor40, shape: BoxShape.circle), child: Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: AppTheme.greenColor, shape: BoxShape.circle), child: const Icon(Icons.check, size: 40, color: Colors.white))),
              const SizedBox(height: 12),
              CustomText(text: StringsConstant.strThankYou, fontSize: 20, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor),
              CustomText(text: StringsConstant.strCarmenStewart, fontSize: 16, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
            ],
          ),
          SizedBox(height: 20),
          /*Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignmentaceBetween, children: [CustomText(text: StringsConstant.strRegularVisit, fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor), CustomText(text: StringsConstant.strPowerCheck, fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor)]),
                const SizedBox(height: 8),
                Row(mainAxisAlignment: MainAxisAlignmentaceBetween, children: const [CustomText(text: StringsConstant.strDateTime, fontSize: 12, fontWeight: AppTheme.fontLight), CustomText(text: '11 July, 2024 11:00 PM', fontSize: 12, fontWeight: AppTheme.fontLight)]),
                SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final dashWidth = 5.0;
                    final dashSpace = 5.0;
                    final dashCount = (width / (dashWidth + dashSpace)).floor();
                    return Row(
                      mainAxisAlignment: MainAxisAlignmentaceBetween,
                      children: List.generate(dashCount, (_) {
                        return Container(width: dashWidth, height: 1, color: Colors.white30);
                      }),
                    );
                  },
                ),
                //const Divider(color: Colors.white12, height: 24),
                SizedBox(height: 20),
                CustomText(text: '₹300', fontSize: 16, fontWeight: AppTheme.fontSemiBold, color: AppTheme.greenColor),
              ],
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(
              children: [
                Container(

                  decoration: BoxDecoration(
                    color: AppTheme.appColorShade25,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [CustomText(text: StringsConstant.strRegularVisit, fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor), CustomText(text: StringsConstant.strPowerCheck, fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor)]),
                        const SizedBox(height: 8),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [CustomText(text: StringsConstant.strDateTime, fontSize: 12, fontWeight: AppTheme.fontLight), CustomText(text: '11 July, 2024 11:00 PM', fontSize: 12, fontWeight: AppTheme.fontLight)]),
                        SizedBox(height: 60),
                         DottedLine(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            lineLength: double.infinity,
                            lineThickness: 0.5,
                            dashLength: 8,
                            dashColor: AppTheme.whiteColor,
                            dashGapLength: 8,
                            dashGapColor: Colors.transparent),
                        SizedBox(height: 26),
                        CustomText(text: '₹300', fontSize: 16, fontWeight: AppTheme.fontSemiBold,color: AppTheme.greenColor),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 50,
                  child: Container(
                    height: 40,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: AppTheme.appColor),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 50,
                  child: Container(
                    height: 40,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color:AppTheme.appColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Column(children: [CustomText(text: '00:59', fontSize: 24, fontWeight: AppTheme.fontLight), SizedBox(height: 10),CustomText(text: 'Please Wait', fontSize: 16, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(14),
            child: ButtonWidget(text: StringsConstant.strViewDetails, onTap: ()=>newNextScreen(context,BookingListScreen()) ,width: double.infinity),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}

class SorryScreen extends StatefulWidget {
  const SorryScreen({super.key});

  @override
  State<SorryScreen> createState() => _SorryScreenState();
}

class _SorryScreenState extends State<SorryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: Column(
        children: [
          Spacer(),
          Column  (
            children: [
              Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppTheme.greenColor40, shape: BoxShape.circle), child: Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: AppTheme.greenColor, shape: BoxShape.circle), child: const Icon(Icons.close, size: 40, color: Colors.white))),
              const SizedBox(height: 12),
              CustomText(text: StringsConstant.strSorry, fontSize: 20, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor),
              CustomText(text: StringsConstant.strCarmenStewart, fontSize: 16, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
            ],
          ),
          SizedBox(height: 20),
          /*Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [CustomText(text: StringsConstant.strRegularVisit, fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor), CustomText(text: StringsConstant.strPowerCheck, fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor)]),
                const SizedBox(height: 8),
                CustomText(text: 'Lorem Ipsum is simply dummy text ofas um is simply dummy text ofas been Lorem Ipsum is simply dummy text ofas been ', fontSize: 12, fontWeight: AppTheme.fontLight,textAlign: TextAlign.center),
                SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final dashWidth = 5.0;
                    final dashSpace = 5.0;
                    final dashCount = (width / (dashWidth + dashSpace)).floor();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(dashCount, (_) {
                        return Container(width: dashWidth, height: 1, color: Colors.white30);
                      }),
                    );
                  },
                ),
                //const Divider(color: Colors.white12, height: 24),
                SizedBox(height: 20),
                CustomText(text: '₹300', fontSize: 16, fontWeight: AppTheme.fontSemiBold, color: AppTheme.greenColor),
              ],
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(
              children: [
                Container(

                  decoration: BoxDecoration(
                      color: AppTheme.appColorShade25,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [CustomText(text: StringsConstant.strRegularVisit, fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor), CustomText(text: StringsConstant.strPowerCheck, fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor)]),
                        const SizedBox(height: 8),
                        CustomText(text: 'Lorem Ipsum is simply dummy text ofas um is simply dummy text ofas been Lorem Ipsum is simply dummy text ofas been ', fontSize: 12, fontWeight: AppTheme.fontLight,textAlign: TextAlign.center),
                        SizedBox(height: 60),
                        DottedLine(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            lineLength: double.infinity,
                            lineThickness: 0.5,
                            dashLength: 8,
                            dashColor: AppTheme.whiteColor,
                            dashGapLength: 8,
                            dashGapColor: Colors.transparent),
                        SizedBox(height: 26),
                        CustomText(text: '₹300', fontSize: 16, fontWeight: AppTheme.fontSemiBold,color: AppTheme.greenColor),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 50,
                  child: Container(
                    height: 40,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: AppTheme.appColor),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 50,
                  child: Container(
                    height: 40,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color:AppTheme.appColor),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(14),
            child: ButtonWidget(text: StringsConstant.strViewDetails, onTap: ()=>newNextScreen(context,BookingListScreen()),width: double.infinity),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}

import 'package:ev_tech_user/Screens/ServiceDetails/booking_information_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strServiceDetails),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(width: double.infinity, height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: AssetImage(ImageConstant.INTERIORVCSvg), fit: BoxFit.cover))),
                            SizedBox(height: 8),
                            Row(children: [CustomText(text: StringsConstant.strRegularVisit, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: '⭐ 4.0', fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))]),
                            SizedBox(height: 8),
                            Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: StringsConstant.strSubscribed, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25), child: CustomText(text: 'Lorem Ipsum is simply dummy text ofas been Lorem Ipsum is simply dummy text ofas been Lorem Ipsum is simply dummy text ofas been ', fontSize: 12, fontWeight: AppTheme.fontLight)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: Column(children: [Container(height: 80, margin: EdgeInsets.symmetric(horizontal: 05), decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor40, image: DecorationImage(image: AssetImage('assets/temp/TrustedInformation.png')))), SizedBox(height: 05), CustomText(text: 'Trusted\nInformation', fontSize: 10, fontWeight: AppTheme.fontRegular, textAlign: TextAlign.center)])),
                          SizedBox(width: 10),
                          Expanded(child: Column(children: [Container(height: 80, margin: EdgeInsets.symmetric(horizontal: 05), decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor40, image: DecorationImage(image: AssetImage('assets/temp/TrustedInformation.png')))), SizedBox(height: 05), CustomText(text: 'Data\nConfidentials', fontSize: 10, fontWeight: AppTheme.fontRegular, textAlign: TextAlign.center)])),
                          SizedBox(width: 10),
                          Expanded(child: Column(children: [Container(height: 80, margin: EdgeInsets.symmetric(horizontal: 05), decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor40, image: DecorationImage(image: AssetImage('assets/temp/TrustedInformation.png')))), SizedBox(height: 05), CustomText(text: 'Our\nPromises', fontSize: 10, fontWeight: AppTheme.fontRegular, textAlign: TextAlign.center)])),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Row(children: [CustomText(text: StringsConstant.strReview, fontSize: 16, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), CustomText(text: StringsConstant.strViewAll, fontSize: 16, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)]),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: AppTheme.appColorShade70, borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [CustomText(text: 'Carmen Stewart', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: '⭐ 4.0', fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))]),
                                  CustomText(text: '13 days ago', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
                                  CustomText(text: 'Lorem Ipsum is simply dummy text ofas um is simply dummy text ofas been Lorem Ipsum is simply dummy text ofas been ', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: AppTheme.appColorShade70, borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [CustomText(text: 'Carmen Stewart', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: '⭐ 4.0', fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))]),
                                  CustomText(text: '13 days ago', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
                                  CustomText(text: 'Lorem Ipsum is simply dummy text ofas um is simply dummy text ofas been Lorem Ipsum is simply dummy text ofas been ', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      ButtonWidget(text: StringsConstant.strProceed, onTap: ()=>newNextScreen(context,BookingInformationScreen()), width: double.infinity),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

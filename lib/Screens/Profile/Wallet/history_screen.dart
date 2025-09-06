import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryScreen extends StatefulWidget {
  String methodName;
  HistoryScreen({super.key,required this.methodName});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: widget.methodName),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Center(child: CustomText(text: '12/10/2023 10:00 PM', fontSize: 16, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor)),
                      SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(text: 'For ', fontSize: 14, fontWeight: AppTheme.fontSemiBold,color: AppTheme.greenColor),
                                CustomText(text: 'Cashback', fontSize: 14, fontWeight: AppTheme.fontSemiBold),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(color: AppTheme.greenColor25, borderRadius: BorderRadius.circular(12)),
                                  child: CustomText(text: StringsConstant.strBookingDetails, fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                                ),
                                Spacer(),
                                CustomText(text: '-₹ 300', fontSize: 16, fontWeight: AppTheme.fontMedium)
                              ],
                            ),
                            SizedBox(height: 08),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(12)),
                                child:Row(
                                  children: [
                                    CustomText(text: 'Closing Balance', fontSize: 14, fontWeight: AppTheme.fontRegular),
                                    Spacer(),
                                    CustomText(text: '₹ 300', fontSize: 16, fontWeight: AppTheme.fontMedium)
                                  ],
                                )
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: StringsConstant.strTransactionID, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), CustomText(text: '#267725762', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor)]),
                                      Spacer(),
                                      SvgPicture.asset(ImageConstant.copyPasteSvg),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: StringsConstant.strReferenceID, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), CustomText(text: '#267725762', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor)]),
                                      Spacer(),
                                      SvgPicture.asset(ImageConstant.copyPasteSvg),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

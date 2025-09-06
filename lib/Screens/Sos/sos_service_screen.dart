import 'package:dotted_border/dotted_border.dart';
import 'package:ev_tech_user/Screens/Sos/wating_card.dart';
import 'package:ev_tech_user/Screens/Subscription/subscription_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SosServiceScreen extends StatefulWidget {
  const SosServiceScreen({super.key});

  @override
  State<SosServiceScreen> createState() => _SosServiceScreenState();
}

class _SosServiceScreenState extends State<SosServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strSOSService),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: StringsConstant.strProblemDescription, fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                      SizedBox(height: 8),
                      CustomTextField(hintText: '',maxLine: 3),
                      SizedBox(height: 10),
                      CustomText(text: StringsConstant.strUploadPhoto, fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(16),
                              dashPattern: [6, 4],
                              color:AppTheme.whiteColor,
                              strokeWidth: 0.5,
                              child: Container(
                                height: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppTheme.appColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ImageConstant.CameraSvg,
                                      height: 30,

                                    ),
                                    const SizedBox(height: 12),
                                    CustomText(text: 'Photo', fontSize: 10, fontWeight: AppTheme.fontLight,color: AppTheme.whiteColor)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(16),
                              dashPattern: [6, 4],
                              color:AppTheme.whiteColor,
                              strokeWidth: 0.5,
                              child: Container(
                                height: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppTheme.appColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ImageConstant.GallerySvg,
                                      height: 30,

                                    ),
                                    const SizedBox(height: 12),
                                    CustomText(text: 'Choose From Gallery', fontSize: 10, fontWeight: AppTheme.fontLight,color: AppTheme.whiteColor)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CustomText(text: StringsConstant.strYourCurrentLocation, fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppTheme.appColorShade25,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Your Current Location",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              ImageConstant.locationSvg,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomTextField(hintText: StringsConstant.strEnterAdderss,maxLine: 3),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppTheme.appColorShade25,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: StringsConstant.strBookingSummary, fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
                            SizedBox(height: 06),
                            Row(
                              children: [
                                CustomText(text: StringsConstant.strServiceTotal, fontSize: 12, fontWeight: AppTheme.fontLight),
                                Spacer(),
                                CustomText(text: '₹ 260/-', fontSize: 12, fontWeight: AppTheme.fontLight)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(

                        decoration: BoxDecoration(
                          color: AppTheme.greenColor25,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: CustomText(text: StringsConstant.strSubscriptionPlan, fontSize: 14, fontWeight: AppTheme.fontMedium),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                                color: AppTheme.appColorShade25
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Row(
                                  children: [
                                    Expanded(child: CustomText(text: 'Choose a plan that fits your service needs and vehicle usage best.', fontSize: 12, fontWeight: AppTheme.fontLight)),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(color: Color(0xFF516731), shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))]),
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.greenColor),
                                        onPressed: () {
                                          newNextScreen(context,SubscriptionScreen());
                                        },
                                        iconSize: 20,
                                      ),
                                    ),                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ButtonWidget(text: StringsConstant.strSendRequest, onTap: (){newNextScreen(context,WaitingCard());},width: double.infinity),
                      SizedBox(height: 10)
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

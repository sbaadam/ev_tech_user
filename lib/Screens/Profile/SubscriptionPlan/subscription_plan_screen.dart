import 'package:ev_tech_user/Screens/Profile/SubscriptionPlan/upgrade_plan_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';


class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strSubscriptionPlan),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppTheme.appColorShade25
                        ),
                        child: Row(
                          children: [
                            Container(
                              height:60,
                              width: 2,
                              decoration: BoxDecoration(
                                color: AppTheme.greenColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: "Yearly", fontSize: 16, fontWeight: AppTheme.fontMedium),
                                CustomText(text: "• Save 50 %", fontSize: 14, fontWeight: AppTheme.fontLight),
                                CustomText(text: "• Get 7 Days Free", fontSize: 14, fontWeight: AppTheme.fontLight),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: "\$ 50 ", fontSize: 16, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
                                CustomText(text: "Yearly", fontSize: 14, fontWeight: AppTheme.fontLight),
                              ],
                            ),
                            SizedBox(width: 10)
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 80,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppTheme.appColorShade25
                        ),
                        child: Row(
                          children: [
                            Container(
                              height:60,
                              width: 2,
                              decoration: BoxDecoration(
                                color: AppTheme.greenColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: "3 Months", fontSize: 16, fontWeight: AppTheme.fontMedium),
                                CustomText(text: "• Save 50 %", fontSize: 14, fontWeight: AppTheme.fontLight),
                                CustomText(text: "• Get 7 Days Free", fontSize: 14, fontWeight: AppTheme.fontLight),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: "\$ 50 ", fontSize: 16, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
                                CustomText(text: "Yearly", fontSize: 14, fontWeight: AppTheme.fontLight),
                              ],
                            ),
                            SizedBox(width: 10)
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomText(text: StringsConstant.strYourCurrentPlan, fontSize: 16, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
                      SizedBox(height: 10),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(12)),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: StringsConstant.strProPlan, fontSize: 18, fontWeight: AppTheme.fontRegular),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(text: '12 \$ /- ', fontSize: 18, fontWeight: AppTheme.fontRegular),
                                  CustomText(text: 'per Month', fontSize: 12, fontWeight: AppTheme.fontMedium),
                                ],
                              ),
                              SizedBox(height: 08),
                              GestureDetector(
                                onTap: (){
                                  newNextScreen(context,UpgradePlanScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor15),
                                  child: CustomText(text: StringsConstant.strUpgradePlan, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color:AppTheme.greenColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(text: '2 Free Checkups', fontSize: 14, fontWeight: AppTheme.fontRegular)
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color:AppTheme.greenColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(text: 'Priority Support', fontSize: 14, fontWeight: AppTheme.fontRegular)
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color:AppTheme.greenColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(text: 'Exclucive Support', fontSize: 14, fontWeight: AppTheme.fontRegular)
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color:AppTheme.greenColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(text: '2 Free Checkups', fontSize: 14, fontWeight: AppTheme.fontRegular)
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color:AppTheme.greenColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(text: 'Priority Support', fontSize: 14, fontWeight: AppTheme.fontRegular)
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color:AppTheme.greenColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(text: 'Exclucive Support', fontSize: 14, fontWeight: AppTheme.fontRegular)
                                ],
                              ),
                            ],
                          )
                      )
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

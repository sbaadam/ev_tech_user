import 'package:ev_tech_user/Screens/Profile/SubscriptionPlan/plan_done_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart' show newNextScreen;
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';


class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({super.key});

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
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
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                        decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(12)),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Column(
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
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                            Divider(color: AppTheme.whiteColor,thickness: 0.2,height: 0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(text: StringsConstant.strPlanPrice, fontSize: 14, fontWeight: AppTheme.fontRegular),
                                      Spacer(),
                                      CustomText(text: '₹ 300', fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      CustomText(text: StringsConstant.strTaxCharges, fontSize: 14, fontWeight: AppTheme.fontRegular),
                                      Spacer(),
                                      CustomText(text: '₹ 300', fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Divider(color: AppTheme.whiteColor,thickness: 0.2,height: 0),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      CustomText(text: StringsConstant.strTotal , fontSize: 14, fontWeight: AppTheme.fontRegular),
                                      Spacer(),
                                      CustomText(text: '₹ 300', fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                    Spacer(),
                    ButtonWidget(text: StringsConstant.strUpgradePlan, onTap: (){newNextScreen(context,PlanDoneScreen());},width: double.infinity ),
                    SizedBox(height: 22)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

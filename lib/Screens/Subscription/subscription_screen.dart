import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strSubscription),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: 2,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                        return Container(
                          height: 70,
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
                                  CustomText(text: "Package Name", fontSize: 16, fontWeight: AppTheme.fontMedium),
                                  CustomText(text: "• Save 50 %", fontSize: 14, fontWeight: AppTheme.fontLight),
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
                              Spacer(),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(color: Color(0xFF516731), shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))]),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.greenColor),
                                  onPressed: () {
                                    // newNextScreen(context,SubscriptionScreen());
                                  },
                                  iconSize: 20,
                                ),
                              ),
                              SizedBox(width: 10)
                            ],
                          ),
                        );
                      },)
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

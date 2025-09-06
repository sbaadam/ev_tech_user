import 'package:ev_tech_user/Screens/Profile/Wallet/history_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strWallet),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: StringsConstant.strTotalBalance, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), SizedBox(height: 02), CustomText(text: '₹ 300', fontSize: 24, fontWeight: AppTheme.fontMedium)]),
                            Spacer(),
                            Container(height: 45, width: 45, padding: EdgeInsets.all(8), decoration: const BoxDecoration(color: Color(0xFF516731), shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))]), child: SvgPicture.asset(ImageConstant.walletSvg, height: 18, width: 18)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      ButtonWidget(text: StringsConstant.strHistory, onTap: () {}, width: double.infinity),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                newNextScreen(context,HistoryScreen(methodName:StringsConstant.strCashBack));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [CustomText(text: StringsConstant.strCashBack, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), CustomText(text: '+ ₹50', fontSize: 16, fontWeight: AppTheme.fontMedium)]),
                                    SizedBox(height: 02),
                                    CustomText(text: '12/10/2021 10:00 AM', fontSize: 12, fontWeight: AppTheme.fontRegular),
                                  ],
                                ),
                              ),
                            ),
                            Divider(color: AppTheme.colorGrey, thickness: 0.5, height: 0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [CustomText(text: StringsConstant.strWalletDebit, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), CustomText(text: '+ ₹50', fontSize: 16, fontWeight: AppTheme.fontMedium)]),
                                  SizedBox(height: 02),
                                  CustomText(text: '12/10/2021 10:00 AM', fontSize: 12, fontWeight: AppTheme.fontRegular),
                                ],
                              ),
                            ),
                            Divider(color: AppTheme.colorGrey, thickness: 0.5, height: 0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [CustomText(text: StringsConstant.strWelcomeBonus, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), CustomText(text: '+ ₹50', fontSize: 16, fontWeight: AppTheme.fontMedium)]),
                                  SizedBox(height: 02),
                                  CustomText(text: '12/10/2021 10:00 AM', fontSize: 12, fontWeight: AppTheme.fontRegular),
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

import 'package:ev_tech_user/Screens/BookingList/booking_list_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';


class WaitingCard extends StatelessWidget {
  const WaitingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                  decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(16)),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [CustomText(text: 'Waiting', fontSize: 20, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor), const SizedBox(height: 12), CustomText(text: 'Please hold on while we get everything ready for your smooth and seamless experience.', fontSize: 16, fontWeight: AppTheme.fontLight, textAlign: TextAlign.center)]),
                ),
                // Top green circle
                Container(padding: EdgeInsets.all(6), decoration: BoxDecoration(color: AppTheme.greenColor40, shape: BoxShape.circle), child: Container(width: 60, height: 60, decoration: BoxDecoration(color: AppTheme.greenColor, shape: BoxShape.circle))),
              ],
            ),
            SizedBox(height: 25),
            ButtonWidget(
              text: StringsConstant.strContinue,
              onTap: () {
                newNextScreen(context, BookingListScreen());
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

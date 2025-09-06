import 'package:ev_tech_user/Screens/Auth/registration_screen.dart';
import 'package:ev_tech_user/Screens/Booking/booking_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart' show newNextScreen;
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';


class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strBookingList),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: ()=>newNextScreen(context,BookingScreen()),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 4),
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppTheme.appColorShade25
                            ),
                            child:Column(
                              children: [
                                Row(
                                  children: [
                                    CustomText(text: StringsConstant.strRegularVisit, fontSize: 14, fontWeight: AppTheme.fontMedium),
                                    Spacer(),
                                    CustomText(text: '#35653', fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor)
                                  ],
                                ),
                                SizedBox(height: 05),
                                Row(
                                  children: [
                                    CustomText(text: '9/10/2022 10:03 PM ', fontSize: 10, fontWeight: AppTheme.fontLight),
                                    Spacer(),
                                    Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text:index==1?StringsConstant.strBook: index==2?StringsConstant.strCompleted:StringsConstant.strAccepted, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)),
                                  ],
                                ),
                                if(index==1)Divider(color: AppTheme.colorGrey,thickness: 0.2),
                                if(index==1) BorderButton(text: StringsConstant.strCancel, onTap:(){}),
                              ],
                            ),
                          ),
                        );
                      },)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

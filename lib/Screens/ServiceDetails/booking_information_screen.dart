import 'package:ev_tech_user/Screens/ServiceDetails/booking_confirmation_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';


class BookingInformationScreen extends StatefulWidget {
  const BookingInformationScreen({super.key});

  @override
  State<BookingInformationScreen> createState() => _BookingInformationScreenState();
}

class _BookingInformationScreenState extends State<BookingInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strBookingInformation),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 14,left: 14,right: 14),
                              child: Row(children: [CustomText(text: StringsConstant.strAddress, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.appColorShade25, border: Border.all(color: AppTheme.greenColor, width: 0.5)), child: CustomText(text: StringsConstant.strChange, fontSize: 10, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor))]),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 14,right: 14),
                              child: CustomText(text: 'Lorem Ipsum is simply dummy text ofas been', fontSize: 12, fontWeight: AppTheme.fontLight),
                            ),
                            SizedBox(height: 05),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                                image: DecorationImage(image: AssetImage('assets/temp/map.png'),fit: BoxFit.cover)
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomText(text: StringsConstant.strSelectDate, fontSize: 16, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child:Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppTheme.appColorShade25,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 14),
                                    CustomText(text: 'Mon', fontSize: 16, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                                    SizedBox(height: 8),
                                    CustomText(text: '10', fontSize: 12, fontWeight: AppTheme.fontRegular,color: AppTheme.whiteColor),
                                    SizedBox(height: 8),
                                    Container(
                                      height: 15,
                                      decoration: BoxDecoration(
                                        borderRadius:  BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                        color: AppTheme.greenColor
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child:Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppTheme.appColorShade25,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 14),
                                    CustomText(text: 'Mon', fontSize: 16, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                                    SizedBox(height: 8),
                                    CustomText(text: '10', fontSize: 12, fontWeight: AppTheme.fontRegular,color: AppTheme.whiteColor),
                                    SizedBox(height: 8),
                                    Container(
                                      height: 15,
                                      decoration: BoxDecoration(
                                          borderRadius:  BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                          color: AppTheme.greenColor
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child:Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppTheme.appColorShade25
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 14),
                                    CustomText(text: 'Mon', fontSize: 16, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                                    SizedBox(height: 8),
                                    CustomText(text: '10', fontSize: 12, fontWeight: AppTheme.fontRegular,color: AppTheme.whiteColor),
                                    SizedBox(height: 8),
                                    Container(
                                      height: 15,
                                      decoration: BoxDecoration(
                                          borderRadius:  BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                          color: AppTheme.greenColor
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CustomText(text: StringsConstant.strSelectTime, fontSize: 16, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                      SizedBox(height: 10),
                      TimeSelector(),
                      SizedBox(height:30),
                      ButtonWidget(text: StringsConstant.strConfirm, onTap: ()=>newNextScreen(context,BookingConfirmationScreen()),width: double.infinity),
                      SizedBox(height:15),
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

class TimeSelector extends StatefulWidget {
  const TimeSelector({Key? key}) : super(key: key);

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  List<String> timeSlots = [
    "10:00 Pm", "10:30 Pm", "10:45 Pm", "11:00 Pm",
    "11:30 Pm", "12:00 Pm", "01:00 Pm", "12:00 Pm"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(timeSlots.length, (index) {
        bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: isSelected ? AppTheme.greenColor40 :AppTheme.appColorShade25,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              timeSlots[index],
              style: TextStyle(
                color: isSelected?AppTheme.greenColor:AppTheme.whiteColor,
                fontSize: 14,
              ),
            ),
          ),
        );
      }),
    );
  }
}

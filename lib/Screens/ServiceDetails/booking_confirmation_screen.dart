import 'package:ev_tech_user/Screens/ServiceDetails/thank_you_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';


class BookingConfirmationScreen extends StatefulWidget {
  const BookingConfirmationScreen({super.key});

  @override
  State<BookingConfirmationScreen> createState() => _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strBookingConfirmation),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: StringsConstant.strBookingDetails, fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strName, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: 'Carmen Stewart', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strPhoneNo, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '+91 3264676320', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strDateTime, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '11 July, 2024 11:00 PM', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [Expanded(child: CustomText(text: StringsConstant.strAddress, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)), Expanded(flex: 2, child: CustomText(text: 'Lorem Ipsum is simply dummy text ofas um ', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor))]),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: StringsConstant.strBookingDetails, fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(height: 75, width: 75, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSlDkE5N_vnjLR-7ACA1zrxzRLY8mcMDzN0kM_sEe4JPNjzxZE_'), fit: BoxFit.cover))),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [Expanded(child: CustomText(text: 'Regular Visit', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)), CustomText(text: '₹300', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor)]),
                                      SizedBox(height: 8),
                                      CustomText(text: 'Lorem Ipsum is simply dummy text ofas um ', fontSize: 12, fontWeight: AppTheme.fontLight),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor15),
                              child: Row(children: [CustomText(text: StringsConstant.strMembershipPlan, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: StringsConstant.strUpdate, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor))]),
                            ),
                            SizedBox(height: 10),
                            CustomText(text: StringsConstant.strNote, fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                            SizedBox(height: 10),
                            CustomTextField(hintText: '',maxLine: 3),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor15),
                              child: Row(children: [CustomText(text: StringsConstant.strApplyCouponCode, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Icon(Icons.arrow_forward_ios_rounded,color: AppTheme.greenColor)]),
                            ),
                            SizedBox(height: 10),
                            CustomText(text: StringsConstant.strBookingDetails, fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                            SizedBox(height: 8),
                            Row(children: [CustomText(text: StringsConstant.strServiceTotal, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹300', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                            SizedBox(height: 4),
                            Row(children: [CustomText(text: StringsConstant.strOfferDiscount, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹300', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                            SizedBox(height: 4),
                            Row(children: [CustomText(text: StringsConstant.strCouponCodeDiscount, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹300', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                            SizedBox(height: 4),
                            Row(children: [CustomText(text: StringsConstant.strCGST, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹300', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                            SizedBox(height: 4),
                            Row(children: [CustomText(text: StringsConstant.strSGST, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹300', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                            Divider(color: AppTheme.colorGrey,thickness: 0.2),
                            Row(children: [CustomText(text: StringsConstant.strGrandTotal, fontSize: 14, fontWeight: AppTheme.fontRegular), Spacer(), CustomText(text: '₹300', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)]),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                color:AppTheme.appColorShade25,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: AppTheme.greenColor, width: 0.2),
                              ),
                              child: isChecked
                                  ? Icon(Icons.check, size: 18, color:AppTheme.greenColor)
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          CustomText(text: StringsConstant.strTermsCondition, fontSize: 12, fontWeight: AppTheme.fontLight,color: AppTheme.greenColor)
                        ],
                      ),
                      SizedBox(height: 20),
                      ButtonWidget(text: StringsConstant.strContinue, onTap: (){newNextScreen(context, ThankYouScreen());},width: double.infinity),
                    SizedBox(height: 20)
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
  List<String> timeSlots = ["10:00 Pm", "10:30 Pm", "10:45 Pm", "11:00 Pm", "11:30 Pm", "12:00 Pm", "01:00 Pm", "12:00 Pm"];

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
          child: Container(padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20), decoration: BoxDecoration(color: isSelected ? AppTheme.greenColor40 : AppTheme.appColorShade25, borderRadius: BorderRadius.circular(12)), child: Text(timeSlots[index], style: TextStyle(color: isSelected ? AppTheme.greenColor : AppTheme.whiteColor, fontSize: 14))),
        );
      }),
    );
  }
}

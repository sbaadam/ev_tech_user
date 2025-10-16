import 'package:ev_tech_user/Screens/Coupon/coupon_screen.dart';
import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/thank_you_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingConfirmationScreen extends StatefulWidget {
  const BookingConfirmationScreen({super.key});

  @override
  State<BookingConfirmationScreen> createState() => _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  bool isChecked = false;

  String formatDateTime(String date, String time) {
  if (date.isEmpty || time.isEmpty) {
    return '';
  }

  try {
    // Parse date and time
    final parsedDate = DateFormat('dd-MM-yyyy').parse(date);
    final parsedTime = DateFormat('HH:mm').parse(time);

    // Combine into one DateTime
    final mergedDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      parsedTime.hour,
      parsedTime.minute,
    );

    // Format to readable format
    return DateFormat('dd MMM, yyyy hh:mm a').format(mergedDateTime);
  } catch (e) {
    debugPrint('Error in formatDateTime: $e');
    return '';
  }
}


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
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
                            Row(children: [CustomText(text: StringsConstant.strName, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: userProvider.userModel.data?.name ?? '', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strPhoneNo, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: userProvider.userModel.data?.mobile ?? '', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strDateTime, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: formatDateTime(homeProvider.selectDate, homeProvider.selectTime), fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: CustomText(text: StringsConstant.strAddress, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)), Expanded(flex: 2, child: CustomText(text: homeProvider.selectAddress.address ?? '', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor, textAlign: TextAlign.end))]),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: 75, width: 75, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage('${ApiConstant.baseUrlImage}${homeProvider.servicesData.image ?? ''}'), fit: BoxFit.cover))),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: CustomText(text: homeProvider.servicesData.name ?? '', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)), (homeProvider.servicesData.subscriptionPlansIds
                                          ?.map((e) => int.tryParse(e))
                                          .whereType<int>()
                                          .any((id) => id <= (int.tryParse(userProvider.userModel.data?.subscriptionPlanId.toString() ?? '') ?? 0))
                                          ?? false)
                                          ?  Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: StringsConstant.strSubscribed, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)):CustomText(text: '₹${homeProvider.servicesData.price??''}', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor)]),
                                      SizedBox(height: 8),
                                      Html(
                                        data: homeProvider.servicesData.shortDescription ?? '',
                                        style: {
                                          "body": Style(margin: Margins.zero, padding: HtmlPaddings.zero, fontFamily: "LexendDeca", fontSize: FontSize(10), fontWeight: FontWeight.w300, color: AppTheme.whiteColor, lineHeight: LineHeight.number(1.2), textAlign: TextAlign.start),
                                          "p": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
                                          "ol": Style(
                                            margin: Margins.zero, // remove extra space
                                            padding: HtmlPaddings.zero,
                                            listStylePosition: ListStylePosition.inside, // align bullet/number inside
                                          ),
                                          "ul": Style(margin: Margins.zero, padding: HtmlPaddings.zero, listStylePosition: ListStylePosition.inside),
                                          "li": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            /*Container(
                              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor15),
                              child: Row(children: [CustomText(text: StringsConstant.strMembershipPlan, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: StringsConstant.strUpdate, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor))]),
                            ),
                            SizedBox(height: 10),*/
                            CustomText(text: StringsConstant.strNote, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                            SizedBox(height: 10),
                            CustomTextField(hintText: '', maxLine: 3, controller: homeProvider.noteCon),
                            SizedBox(height: 10),
                            if ((homeProvider.servicesData.subscriptionPlansIds
                                ?.map((e) => int.tryParse(e))
                                .whereType<int>()
                                .any((id) => id <= (int.tryParse(userProvider.userModel.data?.subscriptionPlanId.toString() ?? '') ?? 0))
                                ?? false)==false)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (homeProvider.selectCoupon.discountAmount != null && homeProvider.selectCoupon.discountAmount != '') {
                                        homeProvider.removeCoupon();
                                      } else {
                                        newNextScreen(context, CouponScreen());
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor15),
                                      child: Row(children: [CustomText(text: (homeProvider.selectCoupon.discountAmount == null || homeProvider.selectCoupon.discountAmount == '') ? StringsConstant.strApplyCouponCode : 'Remove Coupon Code', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Icon((homeProvider.selectCoupon.discountAmount == null || homeProvider.selectCoupon.discountAmount == '') ? Icons.arrow_forward_ios_rounded : Icons.close, color: AppTheme.greenColor)]),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomText(text: StringsConstant.strBookingDetails, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                                  SizedBox(height: 8),
                                  Row(children: [CustomText(text: 'Service Charge', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹${homeProvider.servicesData.price ?? ''}', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                                  SizedBox(height: 4),
                                  /*Row(children: [CustomText(text: StringsConstant.strOfferDiscount, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹300', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                            SizedBox(height: 4),*/
                                  if (homeProvider.selectCoupon.discountAmount != null) Row(children: [CustomText(text: StringsConstant.strCouponCodeDiscount, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹${homeProvider.selectCoupon.discountAmount}', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                                  SizedBox(height: 4),
                                  Row(children: [CustomText(text: StringsConstant.strCGST, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), const Spacer(), CustomText(text: '₹${(((double.tryParse(homeProvider.servicesData.price?.toString() ?? '') ?? 0) - (double.tryParse(homeProvider.selectCoupon.discountAmount?.toString() ?? '') ?? 0)) * 5 / 100).toStringAsFixed(2)}', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                                  const SizedBox(height: 4),
                                  Row(children: [CustomText(text: StringsConstant.strSGST, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), const Spacer(), CustomText(text: '₹${(((double.tryParse(homeProvider.servicesData.price?.toString() ?? '') ?? 0) - (double.tryParse(homeProvider.selectCoupon.discountAmount?.toString() ?? '') ?? 0)) * 5 / 100).toStringAsFixed(2)}', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                                  Divider(color: AppTheme.colorGrey, thickness: 0.2),
                                  Row(children: [CustomText(text: StringsConstant.strGrandTotal, fontSize: 14, fontWeight: AppTheme.fontRegular), const Spacer(), CustomText(text: '₹${(((double.tryParse(homeProvider.servicesData.price?.toString() ?? '') ?? 0) - (double.tryParse(homeProvider.selectCoupon.discountAmount?.toString() ?? '') ?? 0)) * 1.10).toStringAsFixed(2)}', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)]),
                                ],
                              ),
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
                            child: Container(height: 22, width: 22, decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(6), border: Border.all(color: AppTheme.greenColor, width: 0.2)), child: isChecked ? Icon(Icons.check, size: 18, color: AppTheme.greenColor) : null),
                          ),
                          const SizedBox(width: 12),
                          CustomText(text: StringsConstant.strTermsCondition, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor),
                        ],
                      ),
                      SizedBox(height: 20),
                      ButtonWidget(
                        text: StringsConstant.strContinue,
                        onTap: () {
                          if (isChecked == false) {
                            showToast('Please select terms & condition');
                          } else {
                            homeProvider.storeBookingApi(context);
                          }
                        },
                        width: double.infinity,
                      ),
                      SizedBox(height: 20),
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

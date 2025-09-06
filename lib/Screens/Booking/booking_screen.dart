import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strBooking),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: StringsConstant.strAssignTechnician, fontSize: 14, fontWeight: AppTheme.fontRegular),
                                CustomText(text: 'Name', fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor)
                              ],
                            ),
                               Spacer(),
                            Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppTheme.greenColor40),
                              child: SvgPicture.asset(ImageConstant.simCallSvg),
                            )
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
                            Row(children: [CustomText(text: StringsConstant.strBookingDetails, fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor), Spacer(), CustomText(text: '# 87387', fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strStatus, fontSize: 10, fontWeight: AppTheme.fontLight), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: StringsConstant.strPending, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strName, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: 'Carmen Stewart', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [Expanded(child: CustomText(text: StringsConstant.strAddress, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)), Expanded(flex: 2, child: CustomText(text: 'Lorem Ipsum is simply dummy text ofas um ', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor))]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strPhoneNo, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '+91 3264676320', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strDateTime, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '11 July, 2024 11:00 PM', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
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
                            CustomText(text: StringsConstant.strServiceDetails, fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor),
                            SizedBox(height: 10),
                            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(height: 70, width: 70, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSlDkE5N_vnjLR-7ACA1zrxzRLY8mcMDzN0kM_sEe4JPNjzxZE_'), fit: BoxFit.cover))), SizedBox(width: 10), CustomText(text: 'Regular Visit', fontSize: 14, fontWeight: AppTheme.fontRegular), Spacer(), CustomText(text: '₹300', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)]),
                            SizedBox(height: 10),

                            CustomText(text: StringsConstant.strBookingSummary, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                            SizedBox(height: 8),
                            Row(children: [CustomText(text: StringsConstant.strServiceTotal, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹300', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                            SizedBox(height: 4),
                            Row(children: [CustomText(text: StringsConstant.strCGST, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹300', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                            SizedBox(height: 4),
                            Row(children: [CustomText(text: StringsConstant.strSGST, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹300', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                            Divider(color: AppTheme.colorGrey, thickness: 0.2),
                            Row(children: [CustomText(text: StringsConstant.strGrandTotal, fontSize: 14, fontWeight: AppTheme.fontRegular), Spacer(), CustomText(text: '₹300', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)]),
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
                            Row(
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: StringsConstant.strTransactionID, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), CustomText(text: '#267725762', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor)]),
                                Spacer(),
                                SvgPicture.asset(ImageConstant.copyPasteSvg),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: StringsConstant.strReferenceID, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), CustomText(text: '#267725762', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor)]),
                                Spacer(),
                                SvgPicture.asset(ImageConstant.copyPasteSvg),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      BorderButton(text: StringsConstant.strReschedule, onTap: (){}),
                      SizedBox(height: 10),
                      ButtonWidget(text: StringsConstant.strCancel, onTap:(){},width: double.infinity),
                      SizedBox(height: 10),
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

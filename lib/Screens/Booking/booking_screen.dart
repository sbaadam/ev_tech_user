import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/provider/booking_details_provider.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingScreen extends StatefulWidget {
  String id;

  BookingScreen({super.key, required this.id});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      Provider.of<BookingDetailsProvider>(context, listen: false).getBookingDetailsApi(context, widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final bookingProvider = Provider.of<BookingDetailsProvider>(context);
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
                      if(bookingProvider.bookingDetailsModel.data?.technicianId!=null)Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: StringsConstant.strAssignTechnician, fontSize: 14, fontWeight: AppTheme.fontRegular), CustomText(text: bookingProvider.bookingDetailsModel.data?.technicianSnapshot?.name??'', fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor)]),
                                Spacer(),
                                GestureDetector(onTap: () async {
                                  final number = bookingProvider.bookingDetailsModel.data?.technicianSnapshot?.mobile ?? '';
                                  if (number.isNotEmpty) {
                                    final Uri phoneUri = Uri(scheme: 'tel', path: number);
                                    if (await canLaunchUrl(phoneUri)) {
                                  await launchUrl(phoneUri);
                                  } else {
                                  throw 'Could not launch $phoneUri';
                                  }
                                  } else {
                                    print("Mobile number not found");
                                  }
                                },child: Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppTheme.greenColor40), child: SvgPicture.asset(ImageConstant.simCallSvg))),
                              ],
                            ),
                            SizedBox(height: 8),
                            Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                                child:Row(
                                  children: [
                                    CustomText(text: 'Verify PIN', fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
                                    Spacer(),
                                    CustomText(text: bookingProvider.bookingDetailsModel.data?.servicePin.toString()??'', fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.whiteColor),
                                  ],
                                )
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
                            Row(children: [CustomText(text: StringsConstant.strBookingDetails, fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor), Spacer(), CustomText(text: bookingProvider.bookingDetailsModel.data?.bookingId ?? "", fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strStatus, fontSize: 10, fontWeight: AppTheme.fontLight), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: (bookingProvider.bookingDetailsModel.data?.bookingStatus ?? "").replaceFirstMapped(RegExp(r'^\w'), (match) => match.group(0)!.toUpperCase()), fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strName, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: userProvider.userModel.data?.name ?? '', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [Expanded(child: CustomText(text: StringsConstant.strAddress, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)), Expanded(flex: 2, child: CustomText(text: bookingProvider.bookingDetailsModel.data?.addressSnapshot?.address ?? "", fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor, textAlign: TextAlign.end))]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strPhoneNo, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: bookingProvider.bookingDetailsModel.data?.addressSnapshot?.mobile ?? "", fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                            SizedBox(height: 08),
                            Row(children: [CustomText(text: StringsConstant.strDateTime, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: "${bookingProvider.bookingDetailsModel.data?.date ?? ''} ${bookingProvider.bookingDetailsModel.data?.time ?? ''}", fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)]),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: StringsConstant.strServiceDetails, fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(height: 70, width: 70, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage(bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.image != null && bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.image != '' ? "${ApiConstant.baseUrlImage}${bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.image}" : ImageConstant.dummyImage), fit: BoxFit.cover))),
                                      SizedBox(width: 10),
                                      CustomText(text: bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.name ?? '', fontSize: 14, fontWeight: AppTheme.fontRegular),
                                      Spacer(),
                                      (bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.subscriptionPlansIds
                                          ?.map((e) => int.tryParse(e))
                                          .whereType<int>()
                                          .any((id) => id <= (int.tryParse(userProvider.userModel.data?.subscriptionPlanId.toString() ?? '') ?? 0))
                                          ?? false)
                                          ? Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: StringsConstant.strSubscribed, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))
                                          : CustomText(text: '₹${bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.price ?? ''}', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if ((bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.subscriptionPlansIds
                                ?.map((e) => int.tryParse(e))
                                .whereType<int>()
                                .any((id) => id <= (int.tryParse(userProvider.userModel.data?.subscriptionPlanId.toString() ?? '') ?? 0))
                                ?? false)
                                == false)Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14, right: 14),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: StringsConstant.strBookingSummary, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                                        SizedBox(height: 8),
                                        Row(children: [CustomText(text: StringsConstant.strServiceCharge, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹${bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.price ?? ''}', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                                        if (bookingProvider.bookingDetailsModel.data?.couponSnapshot != null) SizedBox(height: 4),
                                        if (bookingProvider.bookingDetailsModel.data?.couponSnapshot != null) Row(children: [CustomText(text: StringsConstant.strCouponCodeDiscount, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor), Spacer(), CustomText(text: '₹${bookingProvider.bookingDetailsModel.data?.couponSnapshot?.discountAmount ?? ''}', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)]),
                                        SizedBox(height: 4),
                                      ],
                                    ),
                                  ),
                                Divider(color: AppTheme.colorGrey, thickness: 0.2),
                                Padding(
                                  padding: const EdgeInsets.only(left: 14, right: 14),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          CustomText(text: StringsConstant.strSubTotal, fontSize: 14, fontWeight: AppTheme.fontRegular),
                                          Spacer(),
                                          CustomText(
                                            text:
                                            '₹${(() {
                                              final price = double.tryParse(bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.price?.toString() ?? '') ?? 0;
                                              final discount = double.tryParse(bookingProvider.bookingDetailsModel.data?.couponSnapshot?.discountAmount.toString() ?? '') ?? 0;
                                              final total = price - discount;
                                              return total.toStringAsFixed(0);
                                            })()}',
                                            fontSize: 14,
                                            fontWeight: AppTheme.fontRegular,
                                            color: AppTheme.greenColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          CustomText(text: StringsConstant.strCGST, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
                                          Spacer(),
                                          CustomText(
                                            text:
                                            '₹${(() {
                                              final price = double.tryParse(bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.price?.toString() ?? '') ?? 0;
                                              final discount = double.tryParse(bookingProvider.bookingDetailsModel.data?.couponSnapshot?.discountAmount.toString() ?? '') ?? 0;
                                              final total = price - discount;
                                              final cGst = (total * 5) / 100;
                                              return cGst.toStringAsFixed(0);
                                            })()}',
                                            fontSize: 12,
                                            fontWeight: AppTheme.fontLight,
                                            color: AppTheme.greenColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          CustomText(text: StringsConstant.strSGST, fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
                                          Spacer(),
                                          CustomText(
                                            text:
                                            '₹${(() {
                                              final price = double.tryParse(bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.price?.toString() ?? '') ?? 0;
                                              final discount = double.tryParse(bookingProvider.bookingDetailsModel.data?.couponSnapshot?.discountAmount.toString() ?? '') ?? 0;
                                              final total = price - discount;
                                              final cGst = (total * 5) / 100;
                                              return cGst.toStringAsFixed(0);
                                            })()}',
                                            fontSize: 12,
                                            fontWeight: AppTheme.fontLight,
                                            color: AppTheme.greenColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: AppTheme.colorGrey, thickness: 0.2),
                                Padding(
                                  padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
                                  child: Row(
                                    children: [
                                      CustomText(text: StringsConstant.strGrandTotal, fontSize: 14, fontWeight: AppTheme.fontRegular),
                                      Spacer(),
                                      CustomText(
                                        text:
                                        '₹${(() {
                                          final price = double.tryParse(bookingProvider.bookingDetailsModel.data?.serviceSnapshot?.price?.toString() ?? '') ?? 0;
                                          final discount = double.tryParse(bookingProvider.bookingDetailsModel.data?.couponSnapshot?.discountAmount.toString() ?? '') ?? 0;
                                          final total = price - discount;
                                          final cGst = (total * 5) / 100;
                                          final sGst = (total * 5) / 100;
                                          final grandTotal = total + cGst + sGst;
                                          return grandTotal.toStringAsFixed(0);
                                        })()}',
                                        fontSize: 14,
                                        fontWeight: AppTheme.fontRegular,
                                        color: AppTheme.greenColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                            Row(
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: StringsConstant.strTransactionID, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), CustomText(text:  '', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor)]),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    final textToCopy = '';
                                    if (textToCopy.isNotEmpty) {
                                      Clipboard.setData(ClipboardData(text: textToCopy));
                                      showToast('Transaction ID copied to clipboard');
                                    } else {
                                      showToast('Nothing to copy');
                                    }
                                  },
                                  child: SvgPicture.asset(ImageConstant.copyPasteSvg),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: StringsConstant.strReferenceID, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), CustomText(text:  '', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor)]),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    final textToCopy =  '';
                                    if (textToCopy.isNotEmpty) {
                                      Clipboard.setData(ClipboardData(text: textToCopy));
                                      showToast('Reference ID copied to clipboard');
                                    } else {
                                      showToast('Nothing to copy');
                                    }
                                  },
                                  child: SvgPicture.asset(ImageConstant.copyPasteSvg),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      if(bookingProvider.bookingDetailsModel.data?.descriptionFromTechnician!=null)Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(bookingProvider.bookingDetailsModel.data?.descriptionFromTechnician!=null)Padding(padding: const EdgeInsets.only(left: 14, right: 14, top: 14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: 'Description for technicians', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), CustomText(text: bookingProvider.bookingDetailsModel.data?.descriptionFromTechnician??'', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)])),
                            if(bookingProvider.bookingDetailsModel.data?.descriptionFromTechnician!=null)Divider(color: AppTheme.colorGrey, thickness: 0.2),
                            if(bookingProvider.bookingDetailsModel.data!=null&&bookingProvider.bookingDetailsModel.data!.images!=null)SizedBox(
                              height: 70,
                              child: ListView.builder(
                                itemCount: bookingProvider.bookingDetailsModel.data?.images?.length??0,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(margin:EdgeInsets.symmetric(horizontal: 6),height: 70, width: 70, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage(bookingProvider.bookingDetailsModel.data?.images?[index] != null && bookingProvider.bookingDetailsModel.data?.images?[index] != '' ? "${ApiConstant.baseUrlImage}${bookingProvider.bookingDetailsModel.data?.images?[index]??''}" : ImageConstant.dummyImage), fit: BoxFit.cover)));
                                },
                              ),
                            ),

                            SizedBox(height: 10)
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      if(bookingProvider.bookingDetailsModel.data?.bookingStatus=='completed')Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 14,right: 14,top: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: 'Your Rating', fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: RatingBar.builder(
                                          initialRating: bookingProvider.rating,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          unratedColor: AppTheme.colorGrey.withValues(alpha: 0.20),
                                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                                          onRatingUpdate: (rating) {
                                            bookingProvider.setRating(rating);
                                          },
                                        ),
                                      ),
                                      Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: '2.0', fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  CustomText(text: 'Review', fontSize: 14, fontWeight: AppTheme.fontMedium),
                                  SizedBox(height: 5),
                                  CustomTextField(hintText: '',maxLine: 3,controller: bookingProvider.ratDesCon),
                                  SizedBox(height: 10)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      if(bookingProvider.bookingDetailsModel.data?.bookingStatus=='pending')ButtonWidget(text: StringsConstant.strCancel, onTap: () {
                        showCancelPopup(context, widget.id);
                      }, width: double.infinity),
                      if(bookingProvider.bookingDetailsModel.data?.bookingStatus=='pending')SizedBox(height: 10),

                      if(bookingProvider.bookingDetailsModel.data?.bookingStatus=='completed' && bookingProvider.bookingDetailsModel.data?.serviceRating==null)ButtonWidget(text: StringsConstant.strSubmit, onTap: () {
                        bookingProvider.ratingBookingApi(context, widget.id);
                      }, width: double.infinity),
                      if(bookingProvider.bookingDetailsModel.data?.bookingStatus=='completed' && bookingProvider.bookingDetailsModel.data?.serviceRating==null)SizedBox(height: 10),
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

  void showCancelPopup(BuildContext context, String id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.appColor, // black background
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Top Title and Close Icon
                Row(
                  children: [
                    Spacer(),
                    CustomText(text:"Cancel", fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(decoration: BoxDecoration(color: AppTheme.greenColor, shape: BoxShape.circle), padding: const EdgeInsets.all(4), child: const Icon(Icons.close, size: 16, color: Colors.black)),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                CustomText(text: 'Are You Sure you want to cancel booking?', fontSize: 14, fontWeight: AppTheme.fontRegular),

                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(style: OutlinedButton.styleFrom(side: BorderSide(color: AppTheme.greenColor), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: const EdgeInsets.symmetric(vertical: 14)), onPressed: () => Navigator.pop(context), child: CustomText(text: 'No', fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor))),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppTheme.greenColor, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: const EdgeInsets.symmetric(vertical: 14)),
                        onPressed: () {
                          Navigator.pop(context);
                          Provider.of<BookingDetailsProvider>(context, listen: false).cancelBookingApi(context, id,true);
                        },
                        child: CustomText(text: 'Yes', fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.appColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

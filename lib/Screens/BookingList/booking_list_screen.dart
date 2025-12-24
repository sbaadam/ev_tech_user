import 'package:ev_tech_user/Screens/Auth/registration_screen.dart';
import 'package:ev_tech_user/Screens/Booking/booking_screen.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/provider/booking_details_provider.dart';
import 'package:ev_tech_user/Utils/app_conts.dart' show newNextScreen;
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      Provider.of<BookingDetailsProvider>(context, listen: false).getBookingApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingDetailsProvider>(context);
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
                      if (bookingProvider.bookingModel.data != null && bookingProvider.bookingModel.data!.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: bookingProvider.bookingModel.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => newNextScreen(context, BookingScreen(id: bookingProvider.bookingModel.data?[index].id.toString()??'')),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                                child: Column(
                                  children: [
                                    Row(children: [CustomText(text: bookingProvider.bookingModel.data?[index].serviceSnapshot?.name??'', fontSize: 14, fontWeight: AppTheme.fontMedium), Spacer(), CustomText(text: '${bookingProvider.bookingModel.data?[index].bookingId}', fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor)]),
                                    SizedBox(height: 05),
                                    Row(
                                      children: [
                                        CustomText(text: '${bookingProvider.bookingModel.data?[index].date} ${bookingProvider.bookingModel.data?[index].time}', fontSize: 10, fontWeight: AppTheme.fontLight),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40),
                                          child: CustomText(
                                            text: bookingProvider.bookingModel.data?[index].bookingStatus??"",
                                            fontSize: 10,
                                            fontWeight: AppTheme.fontRegular,
                                            color: AppTheme.greenColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (bookingProvider.bookingModel.data?[index].bookingStatus == 'pending') Divider(color: AppTheme.colorGrey, thickness: 0.2),
                                    if (bookingProvider.bookingModel.data?[index].bookingStatus == 'pending') BorderButton(text: StringsConstant.strCancel, onTap: () {
                                      showCancelPopup(context, bookingProvider.bookingModel.data?[index].id.toString()??'');
                                    },height:35,radius:10),
                                  ],
                                ),
                              ),
                            );
                          },
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
                          Provider.of<BookingDetailsProvider>(context, listen: false).cancelBookingApi(context, id,false);
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

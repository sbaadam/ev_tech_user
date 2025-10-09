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
                                    Row(children: [CustomText(text: bookingProvider.bookingModel.data?[index].service?.name??'', fontSize: 14, fontWeight: AppTheme.fontMedium), Spacer(), CustomText(text: '${bookingProvider.bookingModel.data?[index].bookingId}', fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor)]),
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
                                    if (bookingProvider.bookingModel.data?[index].bookingStatus == 'pending') BorderButton(text: StringsConstant.strCancel, onTap: () {},height:35,radius:10),
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
}

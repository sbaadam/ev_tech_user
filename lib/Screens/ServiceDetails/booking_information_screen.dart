import 'package:ev_tech_user/Screens/Address/save_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/booking_confirmation_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';

/// -------------------- MAIN SCREEN --------------------
class BookingInformationScreen extends StatelessWidget {
  const BookingInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: Column(
        children: [
          CustomAppbar(text: StringsConstant.strBookingInformation),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Address Section
                  _buildAddressSection(context, homeProvider),

                  const SizedBox(height: 10),

                  /// Date Section
                  CustomText(text: StringsConstant.strSelectDate, fontSize: 16, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                  const SizedBox(height: 10),
                  const WeekDateSelector(),

                  const SizedBox(height: 10),
                  CustomText(text: StringsConstant.strSelectTime, fontSize: 16, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                  const SizedBox(height: 10),
                  const TimeSelector(),

                  const SizedBox(height: 30),

                  /// Confirm Button
                  ButtonWidget(
                    text: StringsConstant.strConfirm,
                    onTap: () {
                      if (homeProvider.selectAddress.address == null||homeProvider.selectAddress.address == '') {
                        showToast("Please select address");
                      } else if (homeProvider.selectDate == '') {
                        showToast("Please select date");
                      } else if (homeProvider.selectTime == '') {
                        showToast("Please select time");
                      } else {
                        newNextScreen(context, const BookingConfirmationScreen());
                      }
                    },
                    width: double.infinity,
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection(BuildContext context, HomeProvider homeProvider) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title Row
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
            child: Row(
              children: [
                CustomText(text: StringsConstant.strAddress, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    newNextScreen(context, SaveAddressScreen());
                  },
                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.appColorShade25, border: Border.all(color: AppTheme.greenColor, width: 0.5)), child: CustomText(text: homeProvider.selectAddress.address == null ? 'Select' : 'Change', fontSize: 10, fontWeight: AppTheme.fontLight, color: AppTheme.greenColor)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          /// Address text
          if (homeProvider.selectAddress.address != null) Padding(padding: EdgeInsets.symmetric(horizontal: 14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: homeProvider.selectAddress.name ?? '', fontSize: 12, fontWeight: AppTheme.fontLight), CustomText(text: homeProvider.selectAddress.mobile ?? '', fontSize: 12, fontWeight: AppTheme.fontLight), CustomText(text: homeProvider.selectAddress.address ?? '', fontSize: 12, fontWeight: AppTheme.fontLight)])),
          const SizedBox(height: 5),

          /// Map image
          /*Container(
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage('assets/temp/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}

/// -------------------- TIME SELECTOR --------------------
class TimeSelector extends StatefulWidget {
  const TimeSelector({Key? key}) : super(key: key);

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  late List<String> timeSlots;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    timeSlots = _generateTimeSlots(homeProvider.selectDate);
  }

  List<String> _generateTimeSlots(String selectedDate) {
    final today = DateTime.now();
    final todayStr = DateFormat('dd-MM-yyyy').format(today);

    // End time fixed = 19:00
    DateTime end = DateTime(today.year, today.month, today.day, 19, 0);

    // જો આજે હોય તો start = current time (round to next hour/30min)
    // નહિતર start = 10:00
    DateTime start;
    if (selectedDate == todayStr) {
      final now = DateTime.now();
      // current time round to next 30 minutes
      final minute = now.minute >= 60 ? 0 : 60;
      final hour = now.minute >= 60 ? now.hour + 1 : now.hour;
      start = DateTime(today.year, today.month, today.day, hour, minute);

      if (start.isBefore(DateTime(today.year, today.month, today.day, 10, 0))) {
        start = DateTime(today.year, today.month, today.day, 10, 0);
      }
    } else {
      start = DateTime(today.year, today.month, today.day, 10, 0);
    }

    // Generate slots
    Duration step = const Duration(minutes: 60);
    final slots = <String>[];
    while (start.isBefore(end) || start.isAtSameMomentAs(end)) {
      slots.add(DateFormat('HH:mm').format(start));
      start = start.add(step);
    }
    return slots;
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    // Date change થાય ત્યારે slots ફરીથી regenerate કરવા માટે
    timeSlots = _generateTimeSlots(homeProvider.selectDate);

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(timeSlots.length, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() => selectedIndex = index);
            debugPrint("Selected Time: ${timeSlots[index]}");
            homeProvider.setTime(timeSlots[index]);
          },
          child: Container(padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20), decoration: BoxDecoration(color: isSelected ? AppTheme.greenColor40 : AppTheme.appColorShade25, borderRadius: BorderRadius.circular(12)), child: Text(timeSlots[index], style: TextStyle(color: isSelected ? AppTheme.greenColor : AppTheme.whiteColor, fontSize: 14))),
        );
      }),
    );
  }
}

/// -------------------- WEEK DATE SELECTOR --------------------
class WeekDateSelector extends StatefulWidget {
  const WeekDateSelector({Key? key}) : super(key: key);

  @override
  _WeekDateSelectorState createState() => _WeekDateSelectorState();
}

class _WeekDateSelectorState extends State<WeekDateSelector> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.selectDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    final today = DateTime.now();
    final weekDates = List.generate(7, (index) => today.add(Duration(days: index)));

    return Wrap(
      spacing: 8,
      runSpacing: 10,
      children: List.generate(weekDates.length, (index) {
        final date = weekDates[index];
        final dayName = DateFormat('E').format(date);
        final dayNumber = DateFormat('dd').format(date);
        final fullDate = DateFormat('dd-MM-yyyy').format(date);

        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() => selectedIndex = index);
            homeProvider.setDate(fullDate); // ✅ only on tap
            debugPrint("Selected Date: $fullDate");
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
            child: Column(
              children: [const SizedBox(height: 14), CustomText(text: dayName, fontSize: 16, fontWeight: AppTheme.fontRegular, color: isSelected ? AppTheme.greenColor : AppTheme.whiteColor), const SizedBox(height: 8), CustomText(text: dayNumber, fontSize: 12, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor), const SizedBox(height: 8), Container(height: 15, decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)), color: isSelected ? AppTheme.greenColor : Colors.transparent))],
            ),
          ),
        );
      }),
    );
  }
}

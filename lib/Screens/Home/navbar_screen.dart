import 'package:ev_tech_user/Screens/BookingList/booking_list_screen.dart';
import 'package:ev_tech_user/Screens/Home/home_screen.dart';
import 'package:ev_tech_user/Screens/Profile/profile_screen.dart';
import 'package:ev_tech_user/Screens/ServiceList/all_services_screen.dart';
import 'package:ev_tech_user/Screens/Sos/sos_service_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectedIndex = 0;
  DateTime? lastBackPressTime;
  bool _isNavigating = false; // Prevent double taps

  List<Widget> pages = const [];

  @override
  void initState() {
    pages = [
      HomeScreen(
        onService: () {
          setState(() {
            selectedIndex = 1;
          });
        },
      ),
      AllServicesScreen(),
      BookingListScreen(),
      ProfileScreen(),
      SosServiceScreen(),
    ];
    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (selectedIndex != 0) {
      selectedIndex = 0;
      setState(() {});
      return false;
    } else {
      DateTime now = DateTime.now();
      if (lastBackPressTime == null || now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
        lastBackPressTime = now;
        showToast('Press back again to exit');
        return Future.value(false);
      }
      return Future.value(true);
    }
  }

  void onTabTap(int index) {
    if (_isNavigating) return;
    _isNavigating = true;
    setState(() {
      selectedIndex = index;
    });

    // Allow next navigation after small delay
    Future.delayed(const Duration(milliseconds: 400), () {
      _isNavigating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppTheme.appColor,
        body: Stack(
          children: [
            // Page content
            Positioned.fill(child: Padding(padding: const EdgeInsets.only(bottom: 60), child: pages[selectedIndex])),
            // Bottom bar
            Positioned(left: 0, right: 0, bottom: 0, child: CustomBottomBar(selectedIndex: selectedIndex, onTap: onTabTap)),
          ],
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomBar({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Background Container
          Container(height: 60, padding: const EdgeInsets.symmetric(horizontal: 24), decoration: BoxDecoration(color: AppTheme.appColorBox, borderRadius: const BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18))), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_buildNavItem(icon: ImageConstant.homeSvg, index: 0), _buildNavItem(icon: ImageConstant.gridSvg, index: 1), const SizedBox(width: 60), _buildNavItem(icon: ImageConstant.listSvg, index: 2), _buildNavItem(icon: ImageConstant.userSvg, index: 3)])),

          // SOS Button on top center
          Positioned(top: -25, child: GestureDetector(onTap: () => onTap(4), child: Container(height: 60, width: 60, decoration: BoxDecoration(color: AppTheme.greenColor, shape: BoxShape.circle, border: Border.all(color: Colors.black, width: 3)), alignment: Alignment.center, child: const Text('SOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))))),
        ],
      ),
    );
  }

  Widget _buildNavItem({required String icon, required int index}) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(onTap: () => onTap(index), child: Container(height: 48, width: 48, padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: isSelected ? AppTheme.greenColor40 : Colors.transparent, shape: BoxShape.circle), child: SvgPicture.asset(icon, height: 20, width: 20)));
  }
}

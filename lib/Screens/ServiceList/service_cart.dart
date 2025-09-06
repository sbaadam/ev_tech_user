import 'package:ev_tech_user/Screens/ServiceDetails/all_services_cat_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';


class ServiceGrid extends StatefulWidget {
  const ServiceGrid({super.key});

  @override
  State<ServiceGrid> createState() => _ServiceGridState();
}

class _ServiceGridState extends State<ServiceGrid> {

  final List<Map<String, String>> services = [
    {
      'icon': ImageConstant.techAssistSvg,
      'label': 'Tech Assist',
    },
    {
      'icon': ImageConstant.cleanCareSvg,
      'label': 'Clean Care',
    },
    {
      'icon': ImageConstant.powerCheckSvg,
      'label': 'Power Check',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length * 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.70, // tighter, more square
      ),
      itemBuilder: (context, index) {
        final service = services[index % services.length];

        return GestureDetector(
          onTap: () {
            newNextScreen(context,AllServicesCatScreen());
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.appColorBox,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image(image: AssetImage(service['icon']!))
              ),
              const SizedBox(height: 6),
              Text(
                service['label']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

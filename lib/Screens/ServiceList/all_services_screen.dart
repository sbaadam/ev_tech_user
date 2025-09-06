import 'package:ev_tech_user/Screens/ServiceList/service_cart.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';

class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({super.key});

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.only(top: 30, left: 16, right: 16,bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xFF171717),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFF516731),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded, color: AppTheme.greenColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 20,
                  ),
                ),
                const SizedBox(width: 18),
                CustomText(text: StringsConstant.strAllServices, fontSize: 16, fontWeight: AppTheme.fontSemiBold,color: AppTheme.whiteColor),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  ServiceGrid(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

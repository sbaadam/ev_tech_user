import 'package:ev_tech_user/Screens/ServiceDetails/service_details_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';


class AllServicesCatScreen extends StatefulWidget {
  const AllServicesCatScreen({super.key});

  @override
  State<AllServicesCatScreen> createState() => _AllServicesCatScreenState();
}

class _AllServicesCatScreenState extends State<AllServicesCatScreen> {
  List nameList = ['Tech Assist', 'Clean Care', 'Power Check', 'Auto Care', 'Power Check'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strAllServices),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: StringsConstant.strCategory, fontSize: 14, fontWeight: AppTheme.fontRegular),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 90,
                        child: ListView.builder(
                          itemCount: nameList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  margin: EdgeInsets.symmetric(horizontal: 05),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor40),
                                  child: Image(
                                    image: AssetImage(
                                      index == 0
                                          ? ImageConstant.techAssistSvg
                                          : index == 1
                                          ? ImageConstant.cleanCareSvg
                                          : index == 2
                                          ? ImageConstant.powerCheckSvg
                                          : ImageConstant.autoCareSvg,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 05),
                                CustomText(text: nameList[index], fontSize: 10, fontWeight: AppTheme.fontRegular),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomText(text: StringsConstant.strServices, fontSize: 14, fontWeight: AppTheme.fontRegular),
                      SizedBox(height: 04),
                      ServiceWidget(),
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

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    Container(height: 75, width: 75, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage(index == 0 ? 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSlDkE5N_vnjLR-7ACA1zrxzRLY8mcMDzN0kM_sEe4JPNjzxZE_' : 'https://t3.ftcdn.net/jpg/04/32/24/08/360_F_432240885_U5v0N3PaSG4echxjah4OkgpaSFwQdkpx.jpg'), fit: BoxFit.cover))),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: index == 0 ? 'Interior Vacuum Cleaning' : 'Full Body Waterless EV Wash', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              index == 0 ? CustomText(text: '₹300', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor) : Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: StringsConstant.strSubscribed, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)),
                              Spacer(),
                              GestureDetector(onTap: (){
                                newNextScreen(context,ServiceDetailsScreen());
                              },child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: AppTheme.greenColor, width: 0.3)), child: CustomText(text: StringsConstant.strBook, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: AppTheme.colorGrey, thickness: 0.2),
              Padding(padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10), child: Column(children: [CustomText(text: '• Lorem Ipsum is simply dummy text ofas been', fontSize: 10, fontWeight: AppTheme.fontLight), CustomText(text: '• Lorem Ipsum is simply dummy text ofas been', fontSize: 10, fontWeight: AppTheme.fontLight)])),
            ],
          ),
        );
      },
      itemCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

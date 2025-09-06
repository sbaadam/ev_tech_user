import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strService),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.symmetric(vertical: 05),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppTheme.appColorShade25
                        ),
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: 'Routine Check-up', fontSize: 16, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
                                SizedBox(height: 10),
                                CustomText(text: 'Last Done : Apr 15, 2024', fontSize: 14, fontWeight: AppTheme.fontLight),
                                CustomText(text: 'Next Due : Apr 15, 2024', fontSize: 14, fontWeight: AppTheme.fontLight),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index==0?AppTheme.greenColor40:AppTheme.colorGrey
                              ),
                              child: CustomText(text:index==0? StringsConstant.strUpcoming:StringsConstant.strCompleted, fontSize: 10, fontWeight: AppTheme.fontMedium,color:index==0? AppTheme.greenColor:AppTheme.appColor),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppTheme.greenColor40
                              ),
                              child: SvgPicture.asset(ImageConstant.downloadSvg),
                            )
                          ],
                        ),
                      );
                    },),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

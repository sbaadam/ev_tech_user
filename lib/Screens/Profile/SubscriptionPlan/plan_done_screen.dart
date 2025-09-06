import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';


class PlanDoneScreen extends StatefulWidget {
  const PlanDoneScreen({super.key});

  @override
  State<PlanDoneScreen> createState() => _PlanDoneScreenState();
}

class _PlanDoneScreenState extends State<PlanDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: Scaffold(
        backgroundColor: AppTheme.appColor,
        body: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              CustomAppbar(text: ''),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 40),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                              width: 300,
                              decoration: BoxDecoration(
                                color: AppTheme.appColorShade25,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 30),
                                  CustomText(text: 'Success !', fontSize: 20, fontWeight: AppTheme.fontMedium),
                                  const SizedBox(height: 8),
                                  CustomText(text: 'Your 3 Months Plan has Started', fontSize: 16, fontWeight: AppTheme.fontLight),
                                  const SizedBox(height: 20),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [CustomText(text: 'Start Date :', fontSize: 14, fontWeight: AppTheme.fontLight), CustomText(text: '11 July, 2024', fontSize: 14, fontWeight: AppTheme.fontLight)]),
                                  const SizedBox(height: 10),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [CustomText(text: 'End Date :', fontSize: 14, fontWeight: AppTheme.fontLight), CustomText(text: '11 July, 2024', fontSize: 14, fontWeight: AppTheme.fontLight)]),
                                  const SizedBox(height: 20),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor15),
                                      child: CustomText(text: StringsConstant.strContinue, fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(padding: EdgeInsets.all(08), decoration: BoxDecoration(color: AppTheme.greenColor40, shape: BoxShape.circle),child: Container(width: 70, height: 70, decoration: BoxDecoration(color: AppTheme.greenColor, shape: BoxShape.circle), child: Icon(Icons.check, color: AppTheme.whiteColor, size: 30))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

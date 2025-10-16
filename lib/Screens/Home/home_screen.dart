import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Screens/Service/service_screen.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/all_services_cat_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart' show newNextScreen;
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../services/api_conts.dart';


class HomeScreen extends StatefulWidget {
  Function onService;
  HomeScreen({super.key,required this.onService});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List nameList=['Tech Assist','Clean Care','Power Check','Auto Care','Power Check'];

  @override
  void initState() {
    super.initState();
    loadInit();
  }

  loadInit() {
    Future.microtask(() async {
      await Provider.of<UserProvider>(context, listen: false).getProfileApi();
      await Provider.of<HomeProvider>(context, listen: false).getCategoriesApi(context);
    });
  }
  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
    final homeProvider=Provider.of<HomeProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(height: 55, width: 50, decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(userProvider.userModel.data?.profilePhoto!=null?'${ApiConstant.baseUrlImage}${userProvider.userModel.data?.profilePhoto}':userProvider.userModel.data?.profilePhoto??'https://thumbs.dreamstime.com/b/vector-illustration-avatar-dummy-logo-collection-image-icon-stock-isolated-object-set-symbol-web-137160339.jpg'), fit: BoxFit.cover), shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppTheme.greenColor)])),
                  SizedBox(width: 10),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: userProvider.userModel.data?.name??'Ev Tech', fontSize: 16, fontWeight: AppTheme.fontSemiBold), CustomText(text: getGreetingMessage(), fontSize: 14, fontWeight: AppTheme.fontRegular)]),
                  Spacer(),
                  CircleAvatar(radius: 22, backgroundColor: AppTheme.greenColor40, child: SvgPicture.asset(ImageConstant.notificationSvg, height: 22, width: 22)),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorBox,image: DecorationImage(image: AssetImage(ImageConstant.conLineSvg),fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(width: 20),
                            SvgPicture.asset(ImageConstant.carEnergySvg),
                            Spacer(),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(height: 10), CustomText(text: userProvider.userModel.data?.vehicleModel??"", fontSize: 20, fontWeight: AppTheme.fontSemiBold), SizedBox(height: 10), CustomText(text: userProvider.userModel.data?.vehicleNumber??"", fontSize: 16, fontWeight: AppTheme.fontLight)]),
                            SizedBox(width: 30),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15))),
                        child: Row(children: [SizedBox(width: 20), CircleAvatar(radius: 20, backgroundColor: AppTheme.greenColor40, child: SvgPicture.asset(ImageConstant.carSvg, height: 20, width: 20)), SizedBox(width: 10), CustomText(text: userProvider.userModel.data?.vehicleName??"", fontSize: 16, fontWeight: AppTheme.fontMedium), Spacer(), CircleAvatar(radius: 20, backgroundColor: AppTheme.greenColor40, child: SvgPicture.asset(ImageConstant.calendarSvg, height: 20, width: 20)), SizedBox(width: 10), CustomText(text: userProvider.userModel.data?.vehicleYear??"", fontSize: 16, fontWeight: AppTheme.fontMedium), SizedBox(width: 20)]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(child: Container(height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25), child: Column(children: [Spacer(), CircleAvatar(radius: 22, backgroundColor: AppTheme.greenColor40, child: SvgPicture.asset(ImageConstant.healthReportSvg, height: 22, width: 22)), Spacer(), CustomText(text: 'Health Report', fontSize: 10, fontWeight: AppTheme.fontRegular), Spacer()]))),
                  SizedBox(width: 10),
                  Expanded(child: GestureDetector(onTap: (){
                    newNextScreen(context,ServiceScreen());
                  },child: Container(height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25), child: Column(children: [Spacer(), CircleAvatar(radius: 22, backgroundColor: AppTheme.greenColor40, child: SvgPicture.asset(ImageConstant.serviceBookingSvg, height: 22, width: 22)), Spacer(), CustomText(text: 'Service Booking', fontSize: 10, fontWeight: AppTheme.fontRegular), Spacer()])))),
                  SizedBox(width: 10),
                  Expanded(child: Container(height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25), child: Column(children: [Spacer(), CircleAvatar(radius: 22, backgroundColor: AppTheme.greenColor40, child: SvgPicture.asset(ImageConstant.watchingScheduleSvg, height: 22, width: 22)), Spacer(), CustomText(text: 'Washing Schedule', fontSize: 10, fontWeight: AppTheme.fontRegular), Spacer()]))),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                child: Row(
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomText(text: StringsConstant.strSubscriptionSummary, fontSize: 12, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), SizedBox(height: 05), CustomText(text: 'Package Name', fontSize: 16, fontWeight: AppTheme.fontRegular)]),
                    Spacer(),
                    Container(height: 60, padding: EdgeInsets.symmetric(horizontal: 10), alignment: Alignment.center, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppTheme.greenColor40), child: CustomText(text: "${userProvider.userModel.data?.membershipDaysLeft??''} Days", fontSize: 16, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              if(homeProvider.categoriesModel.data!=null)Row(
                  children: [
                    CustomText(text: StringsConstant.strCategory, fontSize: 14, fontWeight: AppTheme.fontRegular),
                    Spacer(),
                    GestureDetector(onTap: (){
                      widget.onService();
                    },child: CustomText(text: StringsConstant.strSeeAll, fontSize: 14, fontWeight: AppTheme.fontRegular)),
                  ]
              ),
              if(homeProvider.categoriesModel.data!=null)SizedBox(height: 10),
              if(homeProvider.categoriesModel.data!=null)SizedBox(
                height: 90,
                child: ListView.builder(
                  itemCount: homeProvider.categoriesModel.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await homeProvider.setCateId(homeProvider.categoriesModel.data?[index].id.toString()??'');
                            newNextScreen(context,AllServicesCatScreen());
                          },
                          child: Container(
                            height: 65,
                            width: 65,
                            margin: EdgeInsets.symmetric(horizontal: 05),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppTheme.greenColor40
                            ),
                            child:Image(image: NetworkImage("${ApiConstant.baseUrlImage}${homeProvider.categoriesModel.data?[index].image??''}"),fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: 05),
                        CustomText(text: homeProvider.categoriesModel.data?[index].name??'', fontSize: 10, fontWeight: AppTheme.fontRegular)
                      ],
                    );
                  },),
              ),
              SizedBox(height: 10),
              CustomText(text: StringsConstant.strYourActiveServices, fontSize: 14, fontWeight: AppTheme.fontRegular),
              SizedBox(height: 10),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
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
            ],
          ),
        ),
      ),
    );
  }
}

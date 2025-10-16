import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/model/service_details_model.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/model/service_list_model.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/service_details_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';


class AllServicesCatScreen extends StatefulWidget {
  AllServicesCatScreen({super.key});

  @override
  State<AllServicesCatScreen> createState() => _AllServicesCatScreenState();
}

class _AllServicesCatScreenState extends State<AllServicesCatScreen> {
  @override
  void initState() {
    super.initState();
    loadInit();
  }

  loadInit() {
    Future.microtask(() async {
      await Provider.of<HomeProvider>(context, listen: false).getCategoriesApi(context);
      await Provider.of<HomeProvider>(context, listen: false).getServiceApi(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    final homeProvider=Provider.of<HomeProvider>(context);
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
                      if(homeProvider.categoriesModel.data!=null)SizedBox(
                        height: 90,
                        child: ListView.builder(
                          itemCount: homeProvider.categoriesModel.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: ()async{
                                await homeProvider.setCateId(homeProvider.categoriesModel.data?[index].id.toString()??'');
                                homeProvider.getServiceApi(context);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: homeProvider.selectCateId==homeProvider.categoriesModel.data?[index].id.toString()?AppTheme.greenColor40:AppTheme.appColor,border: Border.all(color: homeProvider.selectCateId==homeProvider.categoriesModel.data?[index].id.toString()?AppTheme.whiteColor:AppTheme.appColor)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 65,
                                      width: 65,
                                      margin: EdgeInsets.symmetric(horizontal: 05),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor40),
                                      child: Image(
                                        image: NetworkImage(
                                         "${ApiConstant.baseUrlImage}${homeProvider.categoriesModel.data?[index].image??''}"
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 05),
                                    CustomText(text: homeProvider.categoriesModel.data?[index].name??'', fontSize: 10, fontWeight: AppTheme.fontRegular),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomText(text: StringsConstant.strServices, fontSize: 14, fontWeight: AppTheme.fontRegular),
                      SizedBox(height: 04),
                      if(homeProvider.serviceListModel.services!=null)ServiceWidget(),
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
  ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {

  @override
  Widget build(BuildContext context) {
    final serviceProvider=Provider.of<HomeProvider>(context);
    final userProvider=Provider.of<UserProvider>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        String cleanDescription = serviceProvider
            .serviceListModel.services?[index].shortDescription
            ?.replaceAll("<p><br></p>", "")
            .trim() ?? "";

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
                    Container(height: 75, width: 75, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage("${ApiConstant.baseUrlImage}${serviceProvider.serviceListModel.services?[index].image??""}"), fit: BoxFit.cover))),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: serviceProvider.serviceListModel.services?[index].name??'', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              (serviceProvider.serviceListModel.services?[index].subscriptionPlansIds
                                  ?.map((e) => int.tryParse(e))
                                  .whereType<int>()
                                  .any((id) => id <= (int.tryParse(userProvider.userModel.data?.subscriptionPlanId.toString() ?? '') ?? 0))
                                  ?? false)
                                  ?  Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: StringsConstant.strSubscribed, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)):CustomText(text: '₹${serviceProvider.serviceListModel.services?[index].price??''}', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor) ,
                              Spacer(),
                              GestureDetector(onTap: ()async{
                                await serviceProvider.setServiceId(serviceProvider.serviceListModel.services?[index]??ServicesData());
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Html(
                  data: cleanDescription,
                  style: {
                    "body": Style(
                      margin: Margins.zero,
                      padding: HtmlPaddings.zero,
                      fontFamily: "LexendDeca",
                      fontSize: FontSize(10),
                      fontWeight: FontWeight.w300, // AppTheme.fontLight
                      color: AppTheme.whiteColor,
                      lineHeight: LineHeight.number(1.1),
                      textAlign: TextAlign.start,
                    ),
                    "p": Style(
                      margin: Margins.zero,
                      padding: HtmlPaddings.zero,
                    ),
                    "ol": Style(
                      margin: Margins.zero, // remove extra space
                      padding: HtmlPaddings.zero,
                      listStylePosition: ListStylePosition.inside, // align bullet/number inside
                    ),
                    "ul": Style(
                      margin: Margins.zero,
                      padding: HtmlPaddings.zero,
                      listStylePosition: ListStylePosition.inside,
                    ),
                    "li": Style(
                      margin: Margins.zero,
                      padding: HtmlPaddings.zero,
                    ),
                  },
                )

              ),
            ],
          ),
        );
      },
      itemCount: serviceProvider.serviceListModel.services!.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

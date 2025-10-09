import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/booking_information_screen.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/model/service_list_model.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ServiceDetailsScreen extends StatefulWidget {
  ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  void initState() {
    super.initState();
    loadInit();
  }

  loadInit() {
    Future.microtask(() async {
      await Provider.of<HomeProvider>(context, listen: false).getServiceDetailsApi(context);
    });
  }

  String timeAgo(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
    Duration diff = DateTime.now().difference(dateTime);

    if (diff.inSeconds < 60) {
      return "just now";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} min${diff.inMinutes > 1 ? 's' : ''} ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago";
    } else if (diff.inDays < 7) {
      return "${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago";
    } else {
      return DateFormat('dd MMM yyyy').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strServiceDetails),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(width: double.infinity, height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: NetworkImage("${ApiConstant.baseUrlImage}${homeProvider.serviceDetailsModel.services?.banner ?? ''}"), fit: BoxFit.cover))),
                            SizedBox(height: 8),
                            Row(children: [CustomText(text: homeProvider.serviceDetailsModel.services?.name ?? '', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: '⭐ 4.0', fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))]),
                            SizedBox(height: 8),
                            (homeProvider.serviceDetailsModel.services?.subscriptionPlansIds?.contains(userProvider.userModel.data?.subscriptionPlanId.toString() ?? '') ?? false)
                                ? Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: StringsConstant.strSubscribed, fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))
                                : CustomText(text: '₹${homeProvider.serviceDetailsModel.services?.price ?? ''}', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                        child: Html(
                          data: homeProvider.serviceDetailsModel.services?.description ?? '',
                          style: {
                            "body": Style(
                              margin: Margins.zero,
                              padding: HtmlPaddings.zero,
                              fontFamily: "LexendDeca",
                              fontSize: FontSize(10),
                              fontWeight: FontWeight.w300,
                              // AppTheme.fontLight
                              color: AppTheme.whiteColor,
                              lineHeight: LineHeight.number(1.2),
                              textAlign: TextAlign.start,
                            ),
                            "p": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
                            "ol": Style(
                              margin: Margins.zero, // remove extra space
                              padding: HtmlPaddings.zero,
                              listStylePosition: ListStylePosition.inside, // align bullet/number inside
                            ),
                            "ul": Style(margin: Margins.zero, padding: HtmlPaddings.zero, listStylePosition: ListStylePosition.inside),
                            "li": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: Column(children: [Container(height: 80, margin: EdgeInsets.symmetric(horizontal: 05), decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor40, image: DecorationImage(image: AssetImage('assets/temp/TrustedInformation.png')))), SizedBox(height: 05), CustomText(text: 'Trusted\nInformation', fontSize: 10, fontWeight: AppTheme.fontRegular, textAlign: TextAlign.center)])),
                          SizedBox(width: 10),
                          Expanded(child: Column(children: [Container(height: 80, margin: EdgeInsets.symmetric(horizontal: 05), decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor40, image: DecorationImage(image: AssetImage('assets/temp/TrustedInformation.png')))), SizedBox(height: 05), CustomText(text: 'Data\nConfidentials', fontSize: 10, fontWeight: AppTheme.fontRegular, textAlign: TextAlign.center)])),
                          SizedBox(width: 10),
                          Expanded(child: Column(children: [Container(height: 80, margin: EdgeInsets.symmetric(horizontal: 05), decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.greenColor40, image: DecorationImage(image: AssetImage('assets/temp/TrustedInformation.png')))), SizedBox(height: 05), CustomText(text: 'Our\nPromises', fontSize: 10, fontWeight: AppTheme.fontRegular, textAlign: TextAlign.center)])),
                        ],
                      ),
                      SizedBox(height: 10),
                      if (homeProvider.serviceDetailsModel.servicesRating != null && homeProvider.serviceDetailsModel.servicesRating!.length != 0)
                        Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Row(children: [CustomText(text: StringsConstant.strReview, fontSize: 16, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), CustomText(text: StringsConstant.strViewAll, fontSize: 16, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)]),
                              SizedBox(height: 10),
                              ListView.builder(
                                itemCount: homeProvider.serviceDetailsModel.servicesRating!.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.symmetric(vertical: 04),
                                    decoration: BoxDecoration(color: AppTheme.appColorShade70, borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [CustomText(text: homeProvider.serviceDetailsModel.servicesRating?[index].user?.name ?? '', fontSize: 14, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.greenColor40), child: CustomText(text: '⭐ ${homeProvider.serviceDetailsModel.servicesRating?[index].rating}', fontSize: 10, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor))]),
                                        CustomText(text: timeAgo(homeProvider.serviceDetailsModel.servicesRating?[index].createdAt ?? ""), fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
                                        CustomText(text: homeProvider.serviceDetailsModel.servicesRating?[index].review ?? '', fontSize: 12, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: 15),
                      ButtonWidget(text: StringsConstant.strProceed, onTap: () => newNextScreen(context, BookingInformationScreen()), width: double.infinity),
                      SizedBox(height: 10),
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

import 'package:ev_tech_user/Screens/Coupon/model/get_coupan_model.dart';
import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  @override
  void initState() {
    super.initState();
    loadInit();
  }

  loadInit() {
    Future.microtask(() async {
      await Provider.of<HomeProvider>(context, listen: false).getCouponApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strCoupon),
            Expanded(child: SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if(homeProvider.getCouponModel.coupons!=null&&homeProvider.getCouponModel.coupons!.length!=0)ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: homeProvider.getCouponModel.coupons!.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: CouponTicScreen(coupons: homeProvider.getCouponModel.coupons?[index]??Coupons()),
                );
              },)
            ])))),
          ],
        ),
      ),
    );
  }
}

class CouponTicScreen extends StatelessWidget {
  Coupons coupons;
  CouponTicScreen({super.key,required this.coupons});

  @override
  Widget build(BuildContext context) {
    final homeProvider=Provider.of<HomeProvider>(context);
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1C), // dark card background
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 8, spreadRadius: 2, offset: const Offset(0, 4))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Row(children: [CustomText(text: coupons.couponCode??'', color: AppTheme.greenColor, fontWeight: AppTheme.fontRegular, fontSize: 14), const Spacer(), GestureDetector(onTap: () async {
              await homeProvider.setCoupon(coupons);
              Navigator.pop(context);
            },child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6), decoration: BoxDecoration(color: AppTheme.greenColor25, borderRadius: BorderRadius.circular(8)), child: CustomText(text: "Apply", color: AppTheme.greenColor, fontSize: 12, fontWeight: AppTheme.fontRegular)))])),
            const SizedBox(height: 8),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Row(children: [SvgPicture.asset(ImageConstant.couponSvg), SizedBox(width: 6), CustomText(text: coupons.couponName??'', fontWeight: AppTheme.fontRegular, color: AppTheme.whiteColor, fontSize: 14)])),
            const SizedBox(height: 8),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Html(
              data: coupons.description??'',
              style: {
                "body": Style(
                  margin: Margins.zero,
                  padding: HtmlPaddings.zero,
                  fontFamily: "LexendDeca",
                  fontSize: FontSize(12),
                  fontWeight: AppTheme.fontLight,
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
            )),
            const SizedBox(height: 12),
            Container(decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))), child: Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Center(child: Icon(Icons.keyboard_arrow_down, color: AppTheme.greenColor)))),
          ],
        ),
      ),
    );
  }
}

/// Ticket Shape with Left & Right Cutouts
class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const cutRadius = 20.0; // notch radius
    final path = Path();

    // Start top-left
    path.moveTo(0, 0);

    // Top edge
    path.lineTo(size.width, 0);

    // Right edge with notch
    path.lineTo(size.width, size.height / 2 - cutRadius);
    path.arcToPoint(Offset(size.width, size.height / 2 + cutRadius), radius: const Radius.circular(cutRadius), clockwise: false);
    path.lineTo(size.width, size.height);

    // Bottom edge
    path.lineTo(0, size.height);

    // Left edge with notch
    path.lineTo(0, size.height / 2 + cutRadius);
    path.arcToPoint(Offset(0, size.height / 2 - cutRadius), radius: const Radius.circular(cutRadius), clockwise: false);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

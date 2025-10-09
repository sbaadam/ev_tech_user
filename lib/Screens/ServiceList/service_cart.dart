import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/all_services_cat_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:provider/provider.dart';

class ServiceGrid extends StatefulWidget {
  const ServiceGrid({super.key});

  @override
  State<ServiceGrid> createState() => _ServiceGridState();
}

class _ServiceGridState extends State<ServiceGrid> {
  @override
  void initState() {
    super.initState();
    loadInit();
  }

  loadInit() {
    Future.microtask(() async {
      await Provider.of<HomeProvider>(context, listen: false).getCategoriesApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: homeProvider.categoriesModel.data?.length??0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.70),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            await homeProvider.setCateId(homeProvider.categoriesModel.data?[index].id.toString()??'');
            newNextScreen(context,AllServicesCatScreen());
          },
          child: Column(mainAxisSize: MainAxisSize.min, children: [Container(height: 70, width: 70, decoration: BoxDecoration(color: AppTheme.appColorBox, borderRadius: BorderRadius.circular(16),image: DecorationImage(image: NetworkImage("${ApiConstant.baseUrlImage}${homeProvider.categoriesModel.data?[index].image ?? ''}"),fit: BoxFit.cover))), const SizedBox(height: 6), CustomText(text: homeProvider.categoriesModel.data?[index].name ?? '', fontSize: 10, fontWeight: AppTheme.fontRegular,maxLine: 1)]),
        );
      },
    );
  }
}

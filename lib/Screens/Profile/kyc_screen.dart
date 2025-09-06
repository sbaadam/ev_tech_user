import 'package:ev_tech_user/Screens/Profile/Provider/kyc_provider.dart';
import 'package:ev_tech_user/Screens/Profile/upload_kyc_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await Provider.of<KycProvider>(context, listen: false).getKycApi(context);
      await Provider.of<KycProvider>(context, listen: false).getPanKycApi(context);
      await Provider.of<KycProvider>(context, listen: false).getDVKycApi(context);
      await Provider.of<KycProvider>(context, listen: false).getRCKycApi(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    final kycProvider=Provider.of<KycProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text:StringsConstant.strKYC),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    containWidget(StringsConstant.strAadharCard,kycProvider.adharKycModel.data?.documentStatus??''),
                    SizedBox(height: 10),
                    containWidget(StringsConstant.strPANCard,kycProvider.panKycModel.data?.documentStatus??''),
                    SizedBox(height: 10),
                    containWidget(StringsConstant.strDrivingLicence,kycProvider.drivingKycModel.data?.documentStatus??''),
                    SizedBox(height: 10),
                    containWidget(StringsConstant.strRCBook,kycProvider.rcKycModel.data?.documentStatus??''),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget containWidget(String name,String status)=>GestureDetector(
    onTap: (){
      newNextScreen(context,UploadKycScreen(name: name));
    },
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppTheme.appColorShade25
      ),
      child: Row(
        children: [
          SizedBox(width: 15),
          SvgPicture.asset(ImageConstant.kycSvg,color: AppTheme.whiteColor),
          SizedBox(width: 20),
          CustomText(text: name, fontSize: 14, fontWeight: AppTheme.fontRegular),
          Spacer(),
          if(status!='')Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(05),color: status=='pending'?AppTheme.blueDark:status=='rejected'?AppTheme.redColor:AppTheme.greenColorDark),
            child: CustomText(text: status[0].toUpperCase() + status.substring(1), fontSize: 10, fontWeight: AppTheme.fontRegular),
          ),
          SizedBox(width: 05),
          Icon(Icons.arrow_forward_ios,color: AppTheme.whiteColor)
        ],
      ),
    ),
  );
}

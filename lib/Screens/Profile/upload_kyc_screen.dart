import 'package:dotted_border/dotted_border.dart';
import 'package:ev_tech_user/Screens/Profile/Provider/kyc_provider.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class UploadKycScreen extends StatefulWidget {
  String name;

  UploadKycScreen({super.key, required this.name});

  @override
  State<UploadKycScreen> createState() => _UploadKycScreenState();
}

class _UploadKycScreenState extends State<UploadKycScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    Future.microtask(() async {
      final provider = await Provider.of<KycProvider>(context, listen: false);
      provider.setUpdateKyc(false);
      if (widget.name == StringsConstant.strAadharCard) {
        provider.setAdharKyc();
      } else if (widget.name == StringsConstant.strPANCard) {
        provider.setPanKyc();
      } else if (widget.name == StringsConstant.strDrivingLicence) {
        provider.setDrivingKyc();
      } else if (widget.name == StringsConstant.strRCBook) {
        provider.setRcKyc();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final kycProvider = Provider.of<KycProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: widget.name),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (StringsConstant.strRCBook != widget.name) CustomText(text: '${widget.name} No.', fontSize: 14, fontWeight: AppTheme.fontLight),
                    if (StringsConstant.strRCBook != widget.name) SizedBox(height: 8),
                    if (StringsConstant.strRCBook != widget.name)
                      CustomTextField(
                        hintText: '1234 1234 1234',
                        controller:
                        widget.name == StringsConstant.strAadharCard
                            ? kycProvider.adharController
                            : widget.name == StringsConstant.strPANCard
                            ? kycProvider.panController
                            : kycProvider.drivingController,
                      ),
                    if (StringsConstant.strRCBook != widget.name) SizedBox(height: 10),
                    CustomText(text: StringsConstant.strUpload, fontSize: 14, fontWeight: AppTheme.fontLight),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              kycProvider.pickAndCropImage(context,widget.name == StringsConstant.strAadharCard
                                  ? 'AadharCard'
                                  : widget.name == StringsConstant.strPANCard
                                  ? 'PANCard'
                                  : widget.name == StringsConstant.strDrivingLicence
                                  ? 'DrivingLicence'
                                  : 'RCBook','${widget.name}Front');
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(16),
                              dashPattern: [6, 4],
                              color: AppTheme.whiteColor,
                              strokeWidth: 0.5,
                              child:
                              (widget.name == StringsConstant.strAadharCard
                                  ? kycProvider.adharFront
                                  : widget.name == StringsConstant.strPANCard
                                  ? kycProvider.panFront
                                  : widget.name == StringsConstant.strDrivingLicence
                                  ? kycProvider.drivingFront
                                  : kycProvider.rcFront) !=
                                  ''
                                  ? Container(height: 100, alignment: Alignment.center, decoration: BoxDecoration(color: AppTheme.appColor, borderRadius: BorderRadius.circular(16),image: DecorationImage(image: NetworkImage('${ApiConstant.baseUrlImage}${widget.name==StringsConstant.strAadharCard?kycProvider.adharFront:widget.name==StringsConstant.strPANCard?kycProvider.panFront:widget.name==StringsConstant.strDrivingLicence?kycProvider.drivingFront:kycProvider.rcFront}'),fit: BoxFit.cover)))
                                  : Container(height: 100, alignment: Alignment.center, decoration: BoxDecoration(color: AppTheme.appColor, borderRadius: BorderRadius.circular(16)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SvgPicture.asset(ImageConstant.uploadSvg, height: 30), const SizedBox(height: 12), CustomText(text: 'Front', fontSize: 10, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)])),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              kycProvider.pickAndCropImage(context,widget.name == StringsConstant.strAadharCard
                                  ? 'AadharCard'
                                  : widget.name == StringsConstant.strPANCard
                                  ? 'PANCard'
                                  : widget.name == StringsConstant.strDrivingLicence
                                  ? 'DrivingLicence'
                                  : 'RCBook','${widget.name}Back');
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(16),
                              dashPattern: [6, 4],
                              color: AppTheme.whiteColor,
                              strokeWidth: 0.5,
                              child:
                              (widget.name == StringsConstant.strAadharCard
                                  ? kycProvider.adharBack
                                  : widget.name == StringsConstant.strPANCard
                                  ? kycProvider.panBack
                                  : widget.name == StringsConstant.strDrivingLicence
                                  ? kycProvider.drivingBack
                                  : kycProvider.rcBack) !=
                                  ''
                                  ? Container(height: 100, alignment: Alignment.center, decoration: BoxDecoration(color: AppTheme.appColor, borderRadius: BorderRadius.circular(16),image: DecorationImage(image: NetworkImage("${ApiConstant.baseUrlImage}${widget.name==StringsConstant.strAadharCard?kycProvider.adharBack:widget.name==StringsConstant.strPANCard?kycProvider.panBack:widget.name==StringsConstant.strDrivingLicence?kycProvider.drivingBack:kycProvider.rcBack}"),fit: BoxFit.cover)))
                                  : Container(height: 100, alignment: Alignment.center, decoration: BoxDecoration(color: AppTheme.appColor, borderRadius: BorderRadius.circular(16)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SvgPicture.asset(ImageConstant.uploadSvg, height: 30), const SizedBox(height: 12), CustomText(text: 'Back', fontSize: 10, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor)])),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    if(kycProvider.isUpdateKyc&&(widget.name == StringsConstant.strAadharCard
                        ? kycProvider.adharKycModel.data?.documentStatus
                        : widget.name == StringsConstant.strPANCard
                        ? kycProvider.panKycModel.data?.documentStatus
                        : widget.name == StringsConstant.strDrivingLicence
                        ? kycProvider.drivingKycModel.data?.documentStatus
                        : kycProvider.rcKycModel.data?.documentStatus)!='approved')ButtonWidget(text: StringsConstant.strSave, onTap: () {
                      if(widget.name==StringsConstant.strAadharCard){
                        if(kycProvider.adharController.text.isEmpty){
                          showToast('Please enter aadhar card number');
                        }else if(kycProvider.adharFront.isEmpty){
                          showToast('Please select aadhar card front image');
                        }else if(kycProvider.adharBack.isEmpty){
                          showToast('Please select aadhar card back image');
                        }else{
                          kycProvider.storeKycApi(context, StringsConstant.strAadharCard);
                        }
                      }else if(widget.name==StringsConstant.strPANCard){
                        if(kycProvider.panController.text.isEmpty){
                          showToast('Please enter pan card number');
                        }else if(kycProvider.panFront.isEmpty){
                          showToast('Please select pan card front image');
                        }else if(kycProvider.panBack.isEmpty){
                          showToast('Please select pan card back image');
                        }else{
                          kycProvider.storeKycApi(context, StringsConstant.strPANCard);
                        }
                      }else if(widget.name==StringsConstant.strDrivingLicence){
                        if(kycProvider.drivingController.text.isEmpty){
                          showToast('Please enter driving licence number');
                        }else if(kycProvider.drivingFront.isEmpty){
                          showToast('Please select driving licence front image');
                        }else if(kycProvider.drivingBack.isEmpty){
                          showToast('Please select driving licence back image');
                        }else{
                          kycProvider.storeKycApi(context, StringsConstant.strDrivingLicence);
                        }
                      }else if(widget.name==StringsConstant.strRCBook){
                        if(kycProvider.rcFront.isEmpty){
                          showToast('Please select rc book front image');
                        }else if(kycProvider.rcBack.isEmpty){
                          showToast('Please select rc book back image');
                        }else{
                          kycProvider.storeKycApi(context, StringsConstant.strRCBook);
                        }
                      }
                    }, width: double.infinity),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

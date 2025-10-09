import 'package:ev_tech_user/Screens/Address/Model/get_address_model.dart' as ad;
import 'package:ev_tech_user/Screens/Address/add_address_screen.dart';
import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SaveAddressScreen extends StatefulWidget {
  const SaveAddressScreen({super.key});

  @override
  State<SaveAddressScreen> createState() => _SaveAddressScreenState();
}

class _SaveAddressScreenState extends State<SaveAddressScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      Provider.of<HomeProvider>(context, listen: false).getAddressApi(context);
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
            CustomAppbar(text: StringsConstant.strSaveAddress),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(homeProvider.getAddressModel.data!=null)Expanded(
                      child: ListView.builder(
                        itemCount: homeProvider.getAddressModel.data!.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            homeProvider.setAddress(homeProvider.getAddressModel.data?[index]??ad.AddressData());
                          },
                          child: Container(
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 14),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(color:homeProvider.selectAddress.id==homeProvider.getAddressModel.data?[index].id?Color(0x268CC63F):AppTheme.appColor, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))]),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 32,
                                                width: 32,
                                                decoration: BoxDecoration(color: homeProvider.selectAddress.id==homeProvider.getAddressModel.data?[index].id?Color(0xFF8CC63F):AppTheme.appColorShade25, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))]),
                                              ),
                                            )
                                        ),
                                        SizedBox(width: 10),
                                        CustomText(text: homeProvider.getAddressModel.data?[index].name??'', fontSize: 14, fontWeight: AppTheme.fontRegular,color: AppTheme.greenColor),
                                        Spacer(),
                                        GestureDetector(onTap: (){
                                          showDialog(
                                            context: context,
                                            builder: (_) => DeleteAddressPopup(onCancel: (){Navigator.pop(context);}, onYes: (){
                                              Navigator.pop(context);
                                              homeProvider.deleteAddressApi(context, homeProvider.getAddressModel.data?[index].id.toString()??"");
                                            })
                                          );
                                        },child: SvgPicture.asset(ImageConstant.deleteSvg)),
                                        SizedBox(width: 10),
                                        GestureDetector(onTap: (){
                                          newNextScreen(context, AddAddressScreen(isEdit: true,addressData:homeProvider.getAddressModel.data?[index]??ad.AddressData() ));
                                        },child: SvgPicture.asset(ImageConstant.editSvg)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Divider(color: AppTheme.whiteColor,thickness: 0.3,height: 0),
                                  SizedBox(height: 7),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: homeProvider.getAddressModel.data?[index].mobile??'', fontSize: 12, fontWeight: AppTheme.fontLight),
                                        CustomText(text: 'Address Type : ${homeProvider.getAddressModel.data?[index].addressType??''}', fontSize: 12, fontWeight: AppTheme.fontLight),
                                        CustomText(text: homeProvider.getAddressModel.data?[index].address??'', fontSize: 12, fontWeight: AppTheme.fontLight),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 14)
                                ],
                              )
                          ),
                        );
                      },),
                    ),
                    SizedBox(height: 10),
                    BorderButton(text: 'Add', onTap: (){newNextScreen(context, AddAddressScreen());}),
                    SizedBox(height: 10),
                    ButtonWidget(text: 'Continue', onTap: (){
                      Navigator.pop(context);
                    },width: double.infinity),
                    SizedBox(height: 10),
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

class DeleteAddressPopup extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onYes;

  const DeleteAddressPopup({
    super.key,
    required this.onCancel,
    required this.onYes
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.appColor, // black background
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Top Title and Close Icon
            Row(
              children: [
                Spacer(),
                CustomText(text:'Address', fontSize: 16, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
                Spacer(),
                InkWell(
                  onTap: onCancel,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.greenColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            CustomText(text: 'Are You Sure you want to delete address?', fontSize: 14, fontWeight: AppTheme.fontRegular),

            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppTheme.greenColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: onCancel,
                    child: CustomText(text: 'No', fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.greenColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: onYes,
                    child: CustomText(text: 'Yes', fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.appColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
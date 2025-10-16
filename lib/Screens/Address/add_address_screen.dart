import 'package:ev_tech_user/Screens/Address/Model/get_address_model.dart' as ad;
import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/custom_dropdown.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/appbar_widget.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatefulWidget {
  bool? isEdit;
  ad.AddressData? addressData;

  AddAddressScreen({super.key, this.isEdit, this.addressData});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<HomeProvider>(context, listen: false).initAddress(widget.isEdit ?? false, widget.addressData ?? ad.AddressData(), context);
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      appBar: CustomAppBar(title: widget.isEdit ?? false ? StringsConstant.strEditAddress : StringsConstant.strAddAddress),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: StringsConstant.strName, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: '', controller: homeProvider.nameCon),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strMobileNo, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: '', controller: homeProvider.mobileCon, keyboardType: TextInputType.number, maxLength: 10),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strAddress, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  homeProvider.getCurrentLocation(context);
                },
                child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), decoration: BoxDecoration(color: AppTheme.appColorShade25, borderRadius: BorderRadius.circular(12)), child: Row(children: [Expanded(child: Text("Your Current Location", style: TextStyle(color: Colors.white, fontSize: 14))), SvgPicture.asset(ImageConstant.locationSvg)])),
              ),
              SizedBox(height: 8),
              CustomTextField(hintText: 'Enter Adderss', controller: homeProvider.addressCon, maxLine: 4),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strState, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              SimpleDropdown(
                items: homeProvider.stateList,
                selectedItem: homeProvider.selectState,
                onChanged: (va) {
                  homeProvider.setState(va,context);
                },
              ),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strCity, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              SimpleDropdown(
                items: homeProvider.cityList,
                selectedItem: homeProvider.selectCity,
                onChanged: (va) {
                  homeProvider.setCity(va);
                },
              ),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strPincode, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: '', controller: homeProvider.pincodeCon, keyboardType: TextInputType.number, maxLength: 6),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strAddressType, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomDropdown<String>(
                items: ["home", "office", "other"],
                selectedItem: homeProvider.selectAddressType.isEmpty ? null : homeProvider.selectAddressType,
                itemLabel: (value) => value,
                onChanged: (value) {
                  homeProvider.setAddressType(value);
                  debugPrint("✅ Selected Address Type: $value");
                },
              ),
              SizedBox(height: 15),
              ButtonWidget(
                text: 'Submit',
                onTap: () {
                  homeProvider.addAddressApi(context);
                },
                width: double.infinity,
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

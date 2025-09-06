import 'package:dotted_border/dotted_border.dart';
import 'package:ev_tech_user/Screens/Auth/Provider/register_provider.dart';
import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/CommonTextfield.dart';
import 'package:ev_tech_user/Widget/appbar_widget.dart';
import 'package:ev_tech_user/Widget/custom_button.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  bool? isEdit;

  RegistrationScreen({super.key, this.isEdit});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (widget.isEdit ?? false) {
        final userProvider=await Provider.of<UserProvider>(context, listen: false);
        final registerProvider=await Provider.of<RegisterProvider>(context, listen: false);
        registerProvider.nameController.text=userProvider.userModel.data?.name??'';
        registerProvider.setProfile(userProvider.userModel.data?.profilePhoto??'');
        registerProvider.emailController.text=userProvider.userModel.data?.email??'';
        registerProvider.mobileController.text=userProvider.userModel.data?.mobile??'';
        registerProvider.vehicleNameController.text=userProvider.userModel.data?.vehicleName??'';
        registerProvider.vehicleNoController.text=userProvider.userModel.data?.vehicleNumber??'';
        registerProvider.modelController.text=userProvider.userModel.data?.vehicleModel??'';
        registerProvider.vYearController.text=userProvider.userModel.data?.vehicleYear??'';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      appBar: CustomAppBar(title: widget.isEdit ?? false ? StringsConstant.strEditProfile : StringsConstant.strRegistration),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(widget.isEdit ?? false)GestureDetector(
                onTap: ()=>registerProvider.pickAndCropImage(context),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: AppTheme.appColorShade25,
                        backgroundImage: NetworkImage(registerProvider.userImage.isNotEmpty?"${ApiConstant.baseUrlImage}${registerProvider.userImage}":'https://thumbs.dreamstime.com/b/vector-illustration-avatar-dummy-logo-collection-image-icon-stock-isolated-object-set-symbol-web-137160339.jpg'),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 4,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: AppTheme.greenColor,
                          child: Icon(Icons.camera_alt,color: AppTheme.appColor,size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if(widget.isEdit ?? false)Center(child: CustomText(text: registerProvider.nameController.text, fontSize: 20, fontWeight: AppTheme.fontMedium)),
              if(widget.isEdit ?? false)SizedBox(height: 8),
              CustomText(text: StringsConstant.strEnterYourName, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: StringsConstant.strEnterYourName, controller: registerProvider.nameController),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strEnterMobileNo, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: StringsConstant.strEnterMobileNo, controller: registerProvider.mobileController, readOnly: true),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strEnterEmailID, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: 'abc@gmail.com', controller: registerProvider.emailController),
              if (!(widget.isEdit ?? false))SizedBox(height: 15),
              if (!(widget.isEdit ?? false))CustomText(text: StringsConstant.strEnterYourPassword, fontSize: 14, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
              if (!(widget.isEdit ?? false))SizedBox(height: 8),
              if (!(widget.isEdit ?? false))CustomTextField(hintText: StringsConstant.strEnterYourPassword, isPassword: true, controller: registerProvider.passController),
              if (!(widget.isEdit ?? false))SizedBox(height: 15),
              if (!(widget.isEdit ?? false))CustomText(text: StringsConstant.strEnterYourConPassword, fontSize: 14, fontWeight: AppTheme.fontLight, color: AppTheme.whiteColor),
              if (!(widget.isEdit ?? false))SizedBox(height: 8),
              if (!(widget.isEdit ?? false))CustomTextField(hintText: StringsConstant.strEnterYourConPassword, isPassword: true, controller: registerProvider.conPassController),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strVehicleName, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: StringsConstant.strVehicleName, controller: registerProvider.vehicleNameController),
              CustomText(text: StringsConstant.strVehicleNo, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: '26562', controller: registerProvider.vehicleNoController, textCapitalization: TextCapitalization.characters),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strModel, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: 'ACCD', controller: registerProvider.modelController),
              SizedBox(height: 15),
              CustomText(text: StringsConstant.strVehicleYear, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              CustomTextField(hintText: '2000', controller: registerProvider.vYearController, keyboardType: TextInputType.number),
              /*SizedBox(height: 15),
              CustomText(text: StringsConstant.strUploadRC, fontSize: 14, fontWeight: AppTheme.fontLight),
              SizedBox(height: 8),
              DottedBorder(
                color: AppTheme.greenColor,
                strokeWidth: 0.5,
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                dashPattern: const [6,3],
                child: Container(height: 45, padding: const EdgeInsets.symmetric(horizontal: 16), decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color:AppTheme.appColorShade25 ), child: Center(child: SvgPicture.asset(ImageConstant.uploadSvg, height: 20))),
              ),*/
              SizedBox(height: 30),
              ButtonWidget(text: StringsConstant.strContinue, onTap: () {
                final emailRegex = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );

                if (!(widget.isEdit??false)) {
                  if (registerProvider.nameController.text.isEmpty) {
                    showToast('Please enter name');
                  } else if (registerProvider.emailController.text.isEmpty) {
                    showToast('Please enter email');
                  } else if (!emailRegex.hasMatch(registerProvider.emailController.text)) {
                    showToast('Please enter valid email');
                  } else if (registerProvider.passController.text.isEmpty) {
                    showToast('Please enter password');
                  } else if (registerProvider.conPassController.text.isEmpty) {
                    showToast('Please enter confirm password');
                  } else if (registerProvider.conPassController.text != registerProvider.passController.text) {
                    showToast('Password and confirm password not match');
                  } else if (registerProvider.vehicleNameController.text.isEmpty) {
                    showToast('Please enter vehicle name');
                  } else if (registerProvider.vehicleNoController.text.isEmpty) {
                    showToast('Please enter vehicle number');
                  } else if (registerProvider.modelController.text.isEmpty) {
                    showToast('Please enter model');
                  } else if (registerProvider.vYearController.text.isEmpty) {
                    showToast('Please enter vehicle year');
                  } else {
                    registerProvider.registerApi(context);
                  }
                }else{
                  registerProvider.updateApi(context);
                }
              }, width: double.infinity),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

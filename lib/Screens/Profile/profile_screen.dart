import 'package:ev_tech_user/Screens/Auth/change_password_screen.dart';
import 'package:ev_tech_user/Screens/Auth/registration_screen.dart';
import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Screens/Profile/SubscriptionPlan/subscription_plan_screen.dart';
import 'package:ev_tech_user/Screens/Profile/Wallet/wallet_screen.dart';
import 'package:ev_tech_user/Screens/Profile/kyc_screen.dart';
import 'package:ev_tech_user/Screens/Service/service_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/image_constant.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(text: StringsConstant.strProfile),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(userProvider.userModel.data?.profilePhoto!=null?'${ApiConstant.baseUrlImage}${userProvider.userModel.data?.profilePhoto}':userProvider.userModel.data?.profilePhoto??'https://thumbs.dreamstime.com/b/vector-illustration-avatar-dummy-logo-collection-image-icon-stock-isolated-object-set-symbol-web-137160339.jpg'),
                        ),
                      ),
                      Center(child: CustomText(text: userProvider.userModel.data?.name??'', fontSize: 20, fontWeight: AppTheme.fontMedium)),
                      SizedBox(height: 22),
                      GestureDetector(onTap: (){
                        newNextScreen(context,RegistrationScreen(isEdit: true));
                      },child: containWidget(StringsConstant.strMyProfile,ImageConstant.userSvg)),
                      SizedBox(height: 8),
                      GestureDetector(onTap: (){
                        newNextScreen(context,KycScreen());
                      },child: containWidget(StringsConstant.strKYC,ImageConstant.kycSvg)),
                      SizedBox(height: 8),
                      GestureDetector(onTap: (){
                        newNextScreen(context,WalletScreen());
                      },child: containWidget(StringsConstant.strWallet,ImageConstant.walletSvg)),
                      SizedBox(height: 8),
                      GestureDetector(onTap: (){
                        newNextScreen(context,SubscriptionPlanScreen());
                      },child: containWidget(StringsConstant.strSubscription,ImageConstant.subscriptionSvg)),
                      SizedBox(height: 8),
                      GestureDetector(onTap: (){
                        newNextScreen(context,ServiceScreen());
                      },child: containWidget(StringsConstant.strServiceBooking,ImageConstant.callSvg)),
                      SizedBox(height: 8),
                      containWidget(StringsConstant.strSupport,ImageConstant.supportSvg),
                      SizedBox(height: 8),
                      containWidget(StringsConstant.strPrivacyPolicy,ImageConstant.policySvg),
                      SizedBox(height: 8),
                      GestureDetector(onTap:(){
                        newNextScreen(context,ChangePasswordScreen());
                      },child: containWidget(StringsConstant.strChangePassword,ImageConstant.changePassSvg)),
                      SizedBox(height: 8),
                      GestureDetector(onTap: (){
                        showDialog(
                          context: context,
                          builder: (_) => LogoutPopup(
                            onCancel: () => Navigator.pop(context),
                          ),
                        );

                      },child: containWidget(StringsConstant.strLogOut,ImageConstant.logoutSvg)),
                      SizedBox(height: 10)
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

  Widget containWidget(String name,String img)=>Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppTheme.appColorShade25
    ),
    child: Row(
      children: [
        SizedBox(width: 15),
        SvgPicture.asset(img),
        SizedBox(width: 20),
        CustomText(text: name, fontSize: 14, fontWeight: AppTheme.fontRegular),
        Spacer(),
        Icon(Icons.arrow_forward_ios,color: AppTheme.greenColor)

      ],
    ),
  );
}

class LogoutPopup extends StatelessWidget {
  final VoidCallback onCancel;

  const LogoutPopup({
    Key? key,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
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
                CustomText(text:StringsConstant.strLogOut, fontSize: 16, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
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

            CustomText(text: 'Are You Sure you want to Log out?', fontSize: 14, fontWeight: AppTheme.fontRegular),

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
                    child: CustomText(text: 'Cancel', fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.greenColor),
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
                    onPressed: (){
                      userProvider.logoutApi(context);
                    },
                    child: CustomText(text: StringsConstant.strLogOut, fontSize: 14, fontWeight: AppTheme.fontMedium,color: AppTheme.appColor),
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


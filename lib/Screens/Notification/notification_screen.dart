import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Screens/Notification/provider/notification_provider.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/Utils/string_constant.dart';
import 'package:ev_tech_user/Widget/custom_appBar.dart';
import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    loadInit();
  }

  loadInit() {
    Future.microtask(() async {
      Provider.of<NotificationGetProvider>(context, listen: false).getNotificationApi(context);
    });
  }

  late UserProvider _userProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _userProvider.getProfileApi();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationGetProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.appColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            CustomAppbar(
              text: StringsConstant.strNotification,
              isDelete: true,
              onDelete: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => LogoutPopup(
                        onCancel: () => Navigator.pop(context),
                        onLogout: () {
                          Navigator.pop(context);
                          notificationProvider.getNotificationDeleteApi(context);
                        },
                      ),
                );
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (notificationProvider.getNotificationModel.data != null)
                        ListView.builder(
                          itemCount: notificationProvider.getNotificationModel.data!.length,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppTheme.appColorShade25),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(height: 60, width: 60, alignment: Alignment.center, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.appColor), child: CustomText(text: (notificationProvider.getNotificationModel.data?[index].title ?? '').isNotEmpty ? (notificationProvider.getNotificationModel.data?[index].title![0] ?? "") : '', fontSize: 18, fontWeight: AppTheme.fontRegular, color: AppTheme.greenColor)),
                                  SizedBox(width: 10),
                                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [CustomText(text: notificationProvider.getNotificationModel.data?[index].title ?? '', fontSize: 14, fontWeight: AppTheme.fontRegular), SizedBox(height: 05), CustomText(text: notificationProvider.getNotificationModel.data?[index].body ?? '', fontSize: 12, fontWeight: AppTheme.fontRegular)])),
                                ],
                              ),
                            );
                          },
                        ),
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

class LogoutPopup extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onLogout;

  const LogoutPopup({Key? key, required this.onCancel, required this.onLogout}) : super(key: key);

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
            Row(children: [Spacer(), CustomText(text: 'Notification', fontSize: 16, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor), Spacer(), InkWell(onTap: onCancel, child: Container(decoration: BoxDecoration(color: AppTheme.greenColor, shape: BoxShape.circle), padding: const EdgeInsets.all(4), child: const Icon(Icons.close, size: 16, color: Colors.black)))]),

            const SizedBox(height: 20),

            CustomText(text: 'Are You Sure you want to delete all notification?', fontSize: 14, fontWeight: AppTheme.fontRegular),

            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: OutlinedButton(style: OutlinedButton.styleFrom(side: BorderSide(color: AppTheme.greenColor), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: const EdgeInsets.symmetric(vertical: 14)), onPressed: onCancel, child: CustomText(text: 'Cancel', fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.greenColor))),
                const SizedBox(width: 12),
                Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppTheme.greenColor, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: const EdgeInsets.symmetric(vertical: 14)), onPressed: onLogout, child: CustomText(text: 'Delete', fontSize: 14, fontWeight: AppTheme.fontMedium, color: AppTheme.appColor))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

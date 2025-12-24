import 'dart:convert';

import 'package:ev_tech_user/Screens/Auth/Provider/changepassword_provider.dart';
import 'package:ev_tech_user/Screens/Auth/Provider/login_provider.dart';
import 'package:ev_tech_user/Screens/Auth/Provider/register_provider.dart';
import 'package:ev_tech_user/Screens/Home/Provider/home_provider.dart';
import 'package:ev_tech_user/Screens/Home/Provider/user_provider.dart';
import 'package:ev_tech_user/Screens/Profile/Provider/kyc_provider.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/provider/booking_details_provider.dart';
import 'package:ev_tech_user/Screens/splash_screen.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:ev_tech_user/provider/connectivity_provider.dart';
import 'package:ev_tech_user/provider/no_connection.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

const AndroidNotificationChannel channel = AndroidNotificationChannel('high_importance_channel', 'High Importance Notifications', description: 'Micro Matching high importance channel', importance: Importance.high);

// Flutter local notifications plugin instance
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> requestNotificationPermission() async {
  if (await Permission.notification.isDenied || await Permission.notification.isPermanentlyDenied) {
    await Permission.notification.request();
  }
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF171717),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await GlobalVariables.loadToken();
  await GlobalVariables.loadRole();
  // Create Android channel
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

  await requestNotificationPermission();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => ChangePasswordProvider()),
        ChangeNotifierProvider(create: (context) => KycProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => BookingDetailsProvider()),
      ],
      child: const MyApp(),
    ),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..textStyle = TextStyle(color: AppTheme.whiteColor,fontFamily: 'LexendDeca')
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.white
    ..maskColor = Colors.green
    ..userInteractions = false
    ..toastPosition = EasyLoadingToastPosition.top
    ..backgroundColor = AppTheme.greenColor
    ..textColor = Colors.white
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ConnectivityProvider>(context, listen: false).syncConnectivityStatus();
      init();
    });
  }

  Future<void> init() async {

    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? fcmToken = await messaging.getToken();
      print("TOKENnnnnn : $fcmToken");
      fcmTokenString = fcmToken ?? '';
    } catch (e) {
      print("FCM Token Error: $e");
    }

    try {
      // Notification initialization settings
      const initializationSettingsAndroid = AndroidInitializationSettings('@drawable/ic_launcher');
      const initializationSettingsIOS = DarwinInitializationSettings();
      const initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          // Handle notification tap
          if (response.payload != null) {
            print("Notification payload: ${response.payload}");
          }
        },
      );

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          localNotification(message.notification!.title ?? '', message.notification!.body ?? '', message.data);
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage msg) {
        print("Notification clicked: ${msg.data}");
      });
    } catch (e) {
      print("Notification Setup Error: $e");
    }
  }

  // Show local notification
  Future<void> localNotification(String title, String body, Map<String, dynamic> data) async {
    try {
      const androidDetails = AndroidNotificationDetails('101', 'EvTech', channelDescription: 'EvTech Notifications', importance: Importance.max, priority: Priority.high, playSound: true, showProgress: true, ticker: 'Micro Matching ticker', color: Color(0xFFFE2E00));

      const iosDetails = DarwinNotificationDetails();

      const notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

      await flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails, payload: jsonEncode(data));
    } catch (e) {
      print("Notification Display Error: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:XOnline(child: SplashScreen()),
        builder: EasyLoading.init()
    );
  }
}

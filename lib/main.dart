import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortify/utils/app_theme.dart';

import 'view/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await initializeRevenueCat();
  runApp(const MyApp());
}

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

// Future<void> initializeRevenueCat() async {
//   await Purchases.setLogLevel(LogLevel.debug);
//
//   PurchasesConfiguration configuration;
//   if (Platform.isAndroid) {
//     configuration = PurchasesConfiguration(googleApiKey);
//     await Purchases.configure(configuration);
//   } else if (Platform.isIOS) {
//     configuration = PurchasesConfiguration(appleApiKey);
//     await Purchases.configure(configuration);
//   }
//   // Ensure logged-in users are connected to RevenueCat
//   if (FirebaseAuth.instance.currentUser != null) {
//     String firebaseUserId = FirebaseAuth.instance.currentUser!.uid;
//
//     try {
//       await Purchases.logIn(firebaseUserId);
//       debugPrint("RevenueCat login successful");
//     } catch (e) {
//       debugPrint("RevenueCat login failed: $e");
//     }
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}

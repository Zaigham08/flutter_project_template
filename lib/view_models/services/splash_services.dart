import 'dart:async';

import 'package:get/get.dart';
import 'package:shortify/view/navbar.dart';

class SplashServices {
  Future<void> isUserNew() async {
    // final prefs = await SharedPreferences.getInstance();
    // bool isNewUser = prefs.getBool('isUserNew') ?? true;

    // if (isNewUser) {
    //   prefs.setBool('isUserNew', false);
    //   await Future.delayed(const Duration(milliseconds: 1500));
    //   Get.offAll(() => const OnBoardingScreen());
    // } else {
    // prefs.setBool('isUserNew', false);
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () => Get.offAll(() => const NavBar()),
    );
    // }
  }
}

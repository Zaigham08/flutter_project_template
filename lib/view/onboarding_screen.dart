import 'package:flutter/material.dart';
import 'package:shortify/res/constants.dart';
import 'package:shortify/res/widgets/appBar%20components/my_appbar.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final generalController = Get.put(GeneralController());
    return Scaffold(
      backgroundColor: blackColor,
      appBar: myAppBar("OnBoarding"),
      body: const Column(
        children: [],
      ),
    );
  }
}

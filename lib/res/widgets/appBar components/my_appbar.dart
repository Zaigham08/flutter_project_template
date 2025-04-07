import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortify/res/constants.dart';
import 'package:shortify/res/widgets/general%20widgets/my_text.dart';

AppBar myAppBar(
  String title, {
  bool useBackIcon = true,
  bool useIcon = true,
}) {
  return AppBar(
    backgroundColor: blackColor,
    centerTitle: true,
    title: MyText(
      title,
      fontSize: 22,
      color: whiteColor,
      fontWeight: FontWeight.bold,
    ),
    leading: useIcon
        ? GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              useBackIcon ? Icons.arrow_back_ios_rounded : Icons.close,
              color: whiteColor,
              size: 24,
            ),
          )
        : null,
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortify/res/constants.dart';
import 'package:shortify/res/helper_extensions.dart';
import 'package:shortify/res/widgets/button%20components/my_text_btn.dart';
import 'package:shortify/res/widgets/general%20widgets/my_container.dart';
import 'package:shortify/res/widgets/general%20widgets/my_text.dart';
import 'package:shortify/view_models/controllers/subscriptions_controller.dart';

class Paywall extends StatefulWidget {
  const Paywall({super.key});

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  final subsController = Get.put(SubscriptionsController());

  @override
  void initState() {
    subsController.fetchSubscriptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 390,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Obx(
              () => subsController.subscriptionPackages.isEmpty
                  ? const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(color: btnColor),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyContainer(
                          width: 390,
                          height: 110,
                          radius: 8,
                          color: whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 13,
                            ),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const MyText(
                                      "Monthly",
                                      fontSize: 22,
                                      color: btnColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    MyText(
                                      subsController.subscriptionPackages
                                          .first.storeProduct.priceString
                                          .removeDecimalZeroes(),
                                      fontSize: 22,
                                      color: blackColor,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        25.ph,
                        MyTextButton(
                          width: 390,
                          height: 45,
                          text: 'Subscribe',
                          onPressed: () {
                            subsController.purchaseSubscription(
                              subsController.subscriptionPackages.first,
                            );
                          },
                        ),
                        25.ph,
                        buildLinks(),
                        20.ph,
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: MyText(
            "Terms of use",
            fontFamily: 'Inter',
            color: dimColor,
          ),
        ),
        MyText('|', color: dimColor),
        GestureDetector(
          onTap: () {},
          child: MyText(
            "Privacy Policy",
            fontFamily: 'Inter',
            color: dimColor,
          ),
        ),
        MyText('|', color: dimColor),
        GestureDetector(
          onTap: () => subsController.restoreSubscription(),
          child: MyText(
            "Restore",
            fontFamily: 'Inter',
            color: dimColor,
          ),
        ),
      ],
    );
  }
}

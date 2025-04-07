import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shortify/res/constants.dart';
import 'package:shortify/utils/util_functions.dart';
import 'package:shortify/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionsController extends GetxController {
  // final _repo = SubscriptionRepository();
  RxBool isCancelled = false.obs, isSubscribed = false.obs;
  RxList<Package> subscriptionPackages = <Package>[].obs;
  late String purchaseStartDate, purchaseEndDate;
  String currentPlan = "Free";

  // final authService = AuthService();

  @override
  void onInit() {
    super.onInit();
    isUserSubscribed();
  }

  Future<void> fetchSubscriptions() async {
    try {
      Offerings offerings = await Purchases.getOfferings();
      subscriptionPackages.value =
          offerings.getOffering("subscriptions")?.availablePackages ?? [];
    } catch (e) {
      debugPrint("Error fetching products: $e");
    }
  }

  Future<void> isUserSubscribed() async {
    debugPrint("--called isUserSubscribed--");

    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();

      // Check if the user has the entitlement
      if (customerInfo.entitlements.active.containsKey(entitlementID)) {
        isSubscribed.value = true;

        // Access active entitlement
        EntitlementInfo? entitlement =
            customerInfo.entitlements.active[entitlementID];

        if (entitlement != null) {
          bool isTrial = entitlement.periodType == PeriodType.trial;
          if (isTrial) {
            currentPlan = "Free";
          } else if (entitlement.productIdentifier.contains("monthly")) {
            currentPlan = "Monthly";
          }

          // Get start and end dates
          purchaseStartDate = formatDate(entitlement.originalPurchaseDate);
          purchaseEndDate = formatDate(entitlement.expirationDate!);

          debugPrint("Plan: $currentPlan");
        }
      } else {
        isSubscribed.value = false;
        debugPrint("No active subscription found.");
      }
    } catch (e) {
      debugPrint("Error checking subscription: $e");
    }
  }

  Future<void> purchaseSubscription(Package package) async {
    try {
      Utils.showSimpleLoading(canPop: Platform.isAndroid ? false : true);
      CustomerInfo customerInfo = await Purchases.purchasePackage(package);
      isSubscribed.value =
          customerInfo.entitlements.all[entitlementID]?.isActive ?? false;

      if (isSubscribed.value) {
        Utils.toastMsg("User Subscribed successfully", color: Colors.green);
        Utils.dismissLoadingDialog();
        // if (!authService.isUserLogin()) {
        //   Get.off(() => const LoginPage());
        // } else {
        //   Get.back();
        // }

        EntitlementInfo? entitlement =
            customerInfo.entitlements.active[entitlementID];

        if (entitlement != null) {
          bool isTrial = entitlement.periodType == PeriodType.trial;
          if (isTrial) {
            currentPlan = "Free";
          } else if (entitlement.productIdentifier.contains("monthly")) {
            currentPlan = "Monthly";
          }
          purchaseStartDate = formatDate(entitlement.originalPurchaseDate);
          purchaseEndDate = formatDate(entitlement.expirationDate!);
        }
      }
    } catch (e) {
      debugPrint("Purchase failed: $e");
    } finally {
      Utils.dismissLoadingDialog();
    }
  }

  // Future<void> loginToRevenueCat() async {
  //   try {
  //     User? firebaseUser = FirebaseAuth.instance.currentUser;
  //     if (firebaseUser != null) {
  //       await Purchases.logIn(firebaseUser.uid);
  //       debugPrint("Logged into RevenueCat with UID: ${firebaseUser.uid}");
  //     }
  //   } catch (e) {
  //     debugPrint("RevenueCat login failed: $e");
  //   }
  // }

  // Future<void> logoutFromRevenueCat() async {
  //   try {
  //     await Purchases.logOut();
  //     debugPrint("Logged out from RevenueCat.");
  //   } catch (e) {
  //     debugPrint("RevenueCat logout failed: $e");
  //   }
  // }

  void manageSubscription() async {
    final Uri googlePlayUrl =
        Uri.parse("https://play.google.com/store/account/subscriptions");
    final Uri appStoreUrl =
        Uri.parse("https://apps.apple.com/account/subscriptions");

    try {
      if (Platform.isAndroid) {
        if (await canLaunchUrl(googlePlayUrl)) {
          await launchUrl(googlePlayUrl);
        } else {
          throw "Could not launch Google Play subscription page.";
        }
      } else if (Platform.isIOS) {
        if (await canLaunchUrl(appStoreUrl)) {
          await launchUrl(appStoreUrl);
        } else {
          throw "Could not launch App Store subscription page.";
        }
      }
    } catch (e) {
      debugPrint("Error opening subscription management page: $e");
    }
  }

  Future<void> restoreSubscription() async {
    try {
      Utils.showSimpleLoading();
      CustomerInfo customerInfo = await Purchases.restorePurchases();
      bool isProUser =
          customerInfo.entitlements.all[entitlementID]?.isActive ?? false;

      if (isProUser) {
        debugPrint("Restored: User has premium access.");
        isSubscribed.value = isProUser;
        Utils.toastMsg(
          "Subscription restored successfully!",
          color: Colors.green,
        );
        // await getPlan();
      } else {
        Utils.toastMsg("No active subscription found.");
      }
    } catch (e) {
      debugPrint("Restore failed: $e");
      Utils.toastMsg("Failed to restore. Please try again.", color: Colors.red);
    } finally {
      Utils.dismissLoadingDialog();
    }
  }

  Future verifySubscription(String verificationToken) async {
    try {
      // Map data = {"purchase_token": verificationToken};
      // await _repo.verifySubscription(data);
      // final response = await _repo.verifySubscription(data);
      // if (response['status'] == "success") {
      //   return true;
      // } else {
      //   return false;
      // }
    } catch (error) {
      Utils.toastMsg("Error: $error");
      // return false;
    }
  }
}

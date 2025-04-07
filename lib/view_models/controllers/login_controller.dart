// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shortify/repository/user_repository.dart';
// import 'package:shortify/utils/utils.dart';
// import 'package:shortify/view%20models/controllers/subscriptions_controller.dart';
// import 'package:shortify/view%20models/services/auth_service.dart';
// import 'package:shortify/view/navbar.dart';
//
// import 'user_controller.dart';
//
// class LoginController extends GetxController {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final emailFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();
//   RxBool hidePassword = true.obs;
//   RxBool loading = false.obs;
//
//   final _auth = FirebaseAuth.instance;
//   final authService = AuthService();
//   final _repo = UserRepository();
//
//   final userController = Get.put(UserController());
//   final generalController = Get.put(GeneralController());
//   final subscriptionsController = Get.put(SubscriptionsController());
//
//   void toggleHidePassword() {
//     hidePassword.value = !hidePassword.value;
//   }
//
//   bool isValidEmail(String email) {
//     final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
//     return emailRegExp.hasMatch(email);
//   }
//
//   void login() async {
//     loading.value = true;
//     final currentEmail = emailController.text.trim();
//     try {
//       final userCredential = await _auth.signInWithEmailAndPassword(
//         email: currentEmail,
//         password: passwordController.text.trim(),
//       );
//       if (userCredential.user != null) {
//         await _repo.createUser().then((response) async {
//           if (userCredential.user!.emailVerified) {
//             await subscriptionsController.loginToRevenueCat();
//             loading.value = false;
//             Get.offAll(
//               () => const NavBar(),
//               transition: Transition.rightToLeft,
//               duration: const Duration(milliseconds: 1500),
//             );
//             Utils.snackBar("Success!", "Login Successfully",
//                 color: Colors.green);
//           } else {
//             loading.value = false;
//             Utils.snackBar(
//                 "Error", "Please verify your email before logging in.");
//           }
//         }).onError((error, stackTrace) {
//           loading.value = false;
//           Utils.toastMsg("error: $error");
//         });
//       }
//     } catch (error) {
//       loading.value = false;
//       Utils.snackBar("Error", error.toString());
//     }
//   }
//
//   void loginWithGoogle() async {
//     Utils.showSimpleLoading();
//     authService.signInWithGoogle().then((response) async {
//       if (response != null) {
//         await _repo.createUser().then((response) async {
//           await subscriptionsController.loginToRevenueCat();
//           Utils.dismissLoadingDialog();
//           Get.offAll(
//             () => const NavBar(),
//             transition: Transition.rightToLeft,
//             duration: const Duration(milliseconds: 1500),
//           );
//           Utils.snackBar("Success!", "Login Successfully", color: Colors.green);
//         }).onError((error, stackTrace) {
//           Utils.dismissLoadingDialog();
//           Utils.toastMsg(error.toString());
//         });
//       } else {
//         Utils.dismissLoadingDialog();
//         Utils.snackBar("Error", 'Login Failed');
//       }
//     }).onError((error, stackTrace) {
//       Utils.dismissLoadingDialog();
//       Utils.snackBar("Error", error.toString());
//     });
//   }
//
//   void loginWithApple() async {
//     Utils.showSimpleLoading();
//     authService.signInWithApple().then((response) async {
//       if (response != null) {
//         await _repo.createUser().then((response) async {
//           await subscriptionsController.loginToRevenueCat();
//           Utils.dismissLoadingDialog();
//           Get.offAll(
//             () => const NavBar(),
//             transition: Transition.rightToLeft,
//             duration: const Duration(milliseconds: 1500),
//           );
//           Utils.snackBar("Success!", "Login Successfully", color: Colors.green);
//         }).onError((error, stackTrace) {
//           Utils.dismissLoadingDialog();
//           Utils.toastMsg(error.toString());
//         });
//       } else {
//         Utils.dismissLoadingDialog();
//         Utils.snackBar("Error", 'Login Failed');
//       }
//     }).onError((error, stackTrace) {
//       Utils.dismissLoadingDialog();
//       Utils.snackBar("Error", error.toString());
//     });
//   }
//
//   void loginWithFacebook() async {
//     Utils.showSimpleLoading();
//     authService.signInWithFacebook().then((response) async {
//       if (response != null) {
//         await _repo.createUser().then((response) async {
//           await subscriptionsController.loginToRevenueCat();
//           Utils.dismissLoadingDialog();
//           Get.offAll(
//             () => const NavBar(),
//             transition: Transition.rightToLeft,
//             duration: const Duration(milliseconds: 1500),
//           );
//           Utils.snackBar("Success!", "Login Successfully", color: Colors.green);
//         }).onError((error, stackTrace) {
//           Utils.dismissLoadingDialog();
//           Utils.toastMsg(error.toString());
//         });
//       } else {
//         Utils.dismissLoadingDialog();
//         Utils.snackBar("Error", 'Login Failed');
//       }
//     }).onError((error, stackTrace) {
//       Utils.dismissLoadingDialog();
//       Utils.snackBar("Error", error.toString());
//     });
//   }
// }

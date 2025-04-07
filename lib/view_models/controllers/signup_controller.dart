// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:shortify/utils/utils.dart';
// import 'package:shortify/view%20models/controllers/user_controller.dart';
// import 'package:shortify/view/auth/login.dart';
//
// import '../../repository/user_repository.dart';
//
// class SignUpController extends GetxController {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final nameFocusNode = FocusNode();
//   final emailFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();
//   final confirmPasswordFocusNode = FocusNode();
//
//   RxBool hidePassword = true.obs,
//       loading = false.obs,
//       passwordNotStrong = true.obs;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final _repo = UserRepository();
//   final userController = Get.put(UserController());
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
//   bool isPasswordStrong(String password) {
//     final regex = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{6,15}$');
//     return regex.hasMatch(password);
//   }
//
//   void signUp() {
//     loading.value = true;
//     _auth
//         .createUserWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     )
//         .then((userCredential) async {
//       await _repo.createUser();
//       userController.getUserData().then((val) {
//         userController.updateUser(
//           name: nameController.text.trim(),
//           showToast: false,
//           startLoading: false,
//           isEmailVerified: false,
//         );
//       });
//       await userCredential.user!.sendEmailVerification().then((_) {
//         Utils.snackBar(
//           "Message",
//           "A verification email has been sent. Please verify your email.",
//         );
//         loading.value = false;
//         Get.to(() => const LoginPage(),
//             transition: Transition.downToUp,
//             duration: const Duration(seconds: 1));
//       }).catchError((error) {
//         loading.value = false;
//         Utils.snackBar("Error", error.toString());
//       });
//     }).catchError((error) {
//       loading.value = false;
//       Utils.snackBar("Error", error.toString());
//     });
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:shortify/res/constants.dart';
// import 'package:shortify/res/helper_extensions.dart';
// import 'package:shortify/res/widgets/appBar%20components/my_appbar.dart';
// import 'package:shortify/res/widgets/button%20components/my_text_btn.dart';
// import 'package:shortify/res/widgets/general%20widgets/my_text.dart';
// import 'package:shortify/res/widgets/general%20widgets/rich_texts_link.dart';
// import 'package:shortify/res/widgets/input%20field%20components/my_text_input_field.dart';
// import 'package:shortify/utils/utils.dart';
// import 'package:shortify/view/auth/signup.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final loginController = Get.put(LoginController());
//     final formKey = GlobalKey<FormState>();
//     return Scaffold(
//       appBar: myAppBar("Login", useBackIcon: false),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(kDefaultPadding),
//           child: Column(
//             children: [
//               30.ph,
//               Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     MyTextInputField(
//                       hintText: "Email",
//                       width: 390,
//                       controller: loginController.emailController,
//                       focusNode: loginController.emailFocusNode,
//                       keyboardType: TextInputType.emailAddress,
//                       textCapitalization: TextCapitalization.none,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Required*";
//                         } else if (!loginController.isValidEmail(value)) {
//                           return 'Email Address not valid';
//                         }
//                         return null;
//                       },
//                       onFieldSubmitted: (_) {
//                         Utils.fieldFocusChange(
//                           context,
//                           loginController.emailFocusNode,
//                           loginController.passwordFocusNode,
//                         );
//                       },
//                     ),
//                     6.ph,
//                     Obx(
//                       () => MyTextInputField(
//                         hintText: "Enter password",
//                         width: 390,
//                         controller: loginController.passwordController,
//                         focusNode: loginController.passwordFocusNode,
//                         hidePassword: loginController.hidePassword.value,
//                         textCapitalization: TextCapitalization.none,
//                         maxLines: 1,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Required*";
//                           }
//                           return null;
//                         },
//                         onFieldSubmitted: (_) {
//                           if (formKey.currentState!.validate()) {
//                             loginController.login();
//                           }
//                         },
//                         widget: GestureDetector(
//                           onTap: () => loginController.toggleHidePassword(),
//                           child: Icon(
//                             CupertinoIcons.eye_slash,
//                             color: dimColor,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               25.ph,
//               Obx(
//                 () => MyTextButton(
//                   text: "Login",
//                   width: 390,
//                   isLoading: loginController.loading.value,
//                   onPressed: () {
//                     if (formKey.currentState!.validate()) {
//                       loginController.login();
//                     }
//                   },
//                 ),
//               ),
//               40.ph,
//               MyRichTextsLink(
//                 text1: "Don't have an account? ",
//                 text2: "Sign Up",
//                 onPressed: () {
//                   Get.to(
//                     () => const SignUpPage(),
//                     transition: Transition.downToUp,
//                     duration: const Duration(milliseconds: 800),
//                   );
//                 },
//               ),
//               12.ph,
//               MyRichTextsLink(
//                 text1: "Forgot your password?",
//                 text2: "",
//                 onPressed: () => Utils.showResetPasswordDialog(
//                   controller: loginController.emailController,
//                 ),
//               ),
//               60.ph,
//               const MyText(
//                 "Or login with",
//                 color: lessDimColor,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//               20.ph,
//               SizedBox(
//                 width: Platform.isIOS ? 170 : 115,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     LoginOptionWidget(
//                       svgPath: "assets/svgs/icon_google.svg",
//                       onTap: () => loginController.loginWithGoogle(),
//                     ),
//                     if (Platform.isIOS)
//                       LoginOptionWidget(
//                         svgPath: "assets/svgs/icon_apple.svg",
//                         onTap: () => loginController.loginWithApple(),
//                       ),
//                     LoginOptionWidget(
//                       svgPath: "assets/svgs/icon_fb.svg",
//                       onTap: () => loginController.loginWithFacebook(),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class LoginOptionWidget extends StatelessWidget {
//   final String svgPath;
//   final VoidCallback onTap;
//
//   const LoginOptionWidget({
//     super.key,
//     required this.svgPath,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 50,
//         height: 50,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: textFieldColor,
//         ),
//         child: Center(child: SvgPicture.asset(svgPath)),
//       ),
//     );
//   }
// }

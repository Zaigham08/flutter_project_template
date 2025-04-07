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
// import 'package:shortify/view%20models/controllers/login_controller.dart';
// import 'package:shortify/view%20models/controllers/signup_controller.dart';
// import 'package:shortify/view/auth/login.dart';
//
// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final signupController = Get.put(SignUpController());
//     final loginController = Get.put(LoginController());
//     final formKey = GlobalKey<FormState>();
//     return Scaffold(
//       appBar: myAppBar("Sign Up", useBackIcon: false),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(kDefaultPadding),
//           child: Column(
//             children: [
//               20.ph,
//               Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     MyTextInputField(
//                       hintText: "Full name",
//                       width: 380,
//                       controller: signupController.nameController,
//                       focusNode: signupController.nameFocusNode,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Required*";
//                         }
//                         return null;
//                       },
//                       onFieldSubmitted: (_) {
//                         Utils.fieldFocusChange(
//                           context,
//                           signupController.nameFocusNode,
//                           signupController.emailFocusNode,
//                         );
//                       },
//                     ),
//                     MyTextInputField(
//                       hintText: "Email",
//                       width: 380,
//                       controller: signupController.emailController,
//                       focusNode: signupController.emailFocusNode,
//                       keyboardType: TextInputType.emailAddress,
//                       textCapitalization: TextCapitalization.none,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Required*";
//                         } else if (!signupController.isValidEmail(value)) {
//                           return 'Email address not valid';
//                         }
//                         return null;
//                       },
//                       onFieldSubmitted: (_) {
//                         Utils.fieldFocusChange(
//                           context,
//                           signupController.emailFocusNode,
//                           signupController.passwordFocusNode,
//                         );
//                       },
//                     ),
//                     Obx(
//                       () => MyTextInputField(
//                         hintText: "Create a password",
//                         width: 390,
//                         textCapitalization: TextCapitalization.none,
//                         controller: signupController.passwordController,
//                         focusNode: signupController.passwordFocusNode,
//                         hidePassword: signupController.hidePassword.value,
//                         maxLines: 1,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Required*";
//                           } else if (!signupController
//                               .isPasswordStrong(value)) {
//                             signupController.passwordNotStrong.value = true;
//                             return null;
//                           }
//                           signupController.passwordNotStrong.value = false;
//                           return null;
//                         },
//                         onFieldSubmitted: (_) {
//                           Utils.fieldFocusChange(
//                             context,
//                             signupController.passwordFocusNode,
//                             signupController.confirmPasswordFocusNode,
//                           );
//                         },
//                         widget: GestureDetector(
//                           onTap: () => signupController.toggleHidePassword(),
//                           child: Icon(
//                             CupertinoIcons.eye_slash,
//                             color: dimColor,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Obx(() {
//                       if (!signupController.passwordNotStrong.value) {
//                         return MyTextInputField(
//                           hintText: "Confirm password",
//                           width: 390,
//                           textCapitalization: TextCapitalization.none,
//                           controller:
//                               signupController.confirmPasswordController,
//                           focusNode: signupController.confirmPasswordFocusNode,
//                           hidePassword: signupController.hidePassword.value,
//                           maxLines: 1,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Required*";
//                             } else if (signupController.passwordController.text
//                                     .trim() !=
//                                 signupController.confirmPasswordController.text
//                                     .trim()) {
//                               return "Password doesn’t match";
//                             }
//                             return null;
//                           },
//                           onFieldSubmitted: (_) {
//                             if (formKey.currentState!.validate()) {
//                               if (!signupController.passwordNotStrong.value) {
//                                 signupController.signUp();
//                               }
//                             }
//                           },
//                           widget: GestureDetector(
//                             onTap: () => signupController.toggleHidePassword(),
//                             child: Icon(
//                               CupertinoIcons.eye_slash,
//                               color: dimColor,
//                               size: 20,
//                             ),
//                           ),
//                         );
//                       }
//                       return const SizedBox.shrink();
//                     }),
//                   ],
//                 ),
//               ),
//               Obx(() {
//                 if (signupController.passwordNotStrong.value) {
//                   return Container(
//                     height: 80,
//                     width: 390,
//                     margin: const EdgeInsets.only(top: 7),
//                     padding: const EdgeInsets.only(left: 25),
//                     decoration: BoxDecoration(
//                       color: textFieldColor,
//                       borderRadius: BorderRadius.circular(2),
//                       border: Border.all(color: btnColor, width: .8),
//                     ),
//                     child: Row(
//                       children: [
//                         SvgPicture.asset(
//                           "assets/svgs/warning_icon.svg",
//                           height: 25,
//                         ),
//                         10.pw,
//                         const MyText(
//                           "7 to 16 characters\n"
//                           "Letters, numbers & underscores only\n"
//                           "Starts with a letter",
//                           fontSize: 14,
//                           color: lessDimColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               }),
//               20.ph,
//               Obx(
//                 () => MyTextButton(
//                   text: "Sign Up",
//                   width: 390,
//                   isLoading: signupController.loading.value,
//                   onPressed: () {
//                     if (formKey.currentState!.validate()) {
//                       if (!signupController.passwordNotStrong.value &&
//                           signupController
//                               .confirmPasswordController.text.isNotEmpty) {
//                         signupController.signUp();
//                       }
//                     }
//                   },
//                 ),
//               ),
//               40.ph,
//               MyRichTextsLink(
//                 text1: "Already have an account? ",
//                 text2: "Login instead",
//                 onPressed: () {
//                   Get.to(
//                     () => const LoginPage(),
//                     transition: Transition.downToUp,
//                     duration: const Duration(milliseconds: 800),
//                   );
//                 },
//               ),
//               50.ph,
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

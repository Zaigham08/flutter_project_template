// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:shortify/utils/utils.dart';
//
// class AuthService {
//   Future<UserCredential?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication gAuth = await gUser!.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: gAuth.accessToken,
//         idToken: gAuth.idToken,
//       );
//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (error) {
//       debugPrint(error.toString());
//       return null;
//     }
//   }
//
//   Future<UserCredential?> signInWithApple() async {
//     try {
//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//       );
//       final credential = OAuthProvider('apple.com').credential(
//         idToken: appleCredential.identityToken,
//       );
//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (error) {
//       debugPrint(error.toString());
//       return null;
//     }
//   }
//
//   Future<UserCredential?> signInWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//
//       final OAuthCredential credential =
//           FacebookAuthProvider.credential(result.accessToken!.tokenString);
//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (error) {
//       debugPrint("Facebook login error: $error");
//       return null;
//     }
//   }
//
//   void resetPassword(TextEditingController emailController) async {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     try {
//       Utils.showSimpleLoading();
//       await auth.sendPasswordResetEmail(email: emailController.text.trim());
//       Utils.dismissLoadingDialog();
//       Utils.toastMsg("Password reset email sent!");
//       Utils.dismissLoadingDialog();
//     } catch (e) {
//       Utils.toastMsg(e.toString());
//     }
//   }
//
//   bool isUserLogin() {
//     try {
//       final auth = FirebaseAuth.instance;
//       final user = auth.currentUser;
//
//       return user != null && user.emailVerified;
//     } catch (e) {
//       debugPrint('Error checking user login: $e');
//       return false;
//     }
//   }
//
//   Future<String?> getIdToken() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       return await user.getIdToken();
//     } else {
//       Utils.toastMsg('User not logged in');
//       return null;
//     }
//   }
// }

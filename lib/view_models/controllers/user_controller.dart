// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shortify/models/user_model.dart';
// import 'package:shortify/repository/user_repository.dart';
// import 'package:shortify/utils/utils.dart';
//
// class UserController extends GetxController {
//   final _repo = UserRepository();
//   final userNameController = TextEditingController().obs;
//   RxBool loading = false.obs;
//   RxString userName = 'User'.obs, userEmail = ''.obs;
//   RxString userId = ''.obs, picture = ''.obs, imgPath = ''.obs;
//
//   Future<void> getUserData() async {
//     try {
//       final Map<String, dynamic> data = await _repo.getUser();
//       final UserModel userModel = UserModel.fromJson(data);
//       userId.value = userModel.userId;
//       userEmail.value = userModel.email;
//       userName.value = userModel.name;
//       imgPath.value = userModel.picture;
//     } catch (error) {
//       debugPrint(error.toString());
//     }
//   }
//
//   void updateUser({
//     String? name,
//     String? picture,
//     bool? isEmailVerified,
//     bool showToast = true,
//     bool startLoading = true,
//   }) async {
//     try {
//       if (startLoading) {
//         Utils.showSimpleLoading();
//       }
//       Map data = {
//         "user_id": userId.value,
//         "email": userEmail.value,
//         "email_verified": isEmailVerified ?? true,
//         "name": name ?? userName.value,
//         "picture": picture ?? imgPath.value
//       };
//       await _repo.updateUser(data).then((response) {
//         Utils.dismissLoadingDialog();
//         if (response['detail'] != null) {
//           Utils.toastMsg(response['detail']);
//         } else {
//           getUserData();
//           if (showToast) {
//             Utils.toastMsg("User updated successfully");
//           }
//         }
//       });
//     } catch (error) {
//       Utils.dismissLoadingDialog();
//       Utils.toastMsg("Error: $error");
//     }
//   }
//
//   Future deleteUser() async {
//     try {
//       Utils.showLoadingDialog('Deleting...');
//       await _repo.deleteUser().then((response) {
//         Utils.dismissLoadingDialog();
//         if (response['detail'] != null) {
//           Utils.toastMsg(response['detail']);
//         } else {
//           Utils.toastMsg("User deleted successfully");
//           Get.back();
//         }
//       });
//     } catch (error) {
//       Utils.dismissLoadingDialog();
//       Utils.toastMsg("Error: $error");
//     }
//   }
// }

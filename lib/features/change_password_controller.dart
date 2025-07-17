import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ChangePasswordController extends GetxController {
  RxBool loading = false.obs;
  
  RxBool newPasswordVisibility = false.obs;
  RxBool confirmPasswordVisibility = false.obs;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  

  
  getChangePasswordController() async {
    loading.value = true;
    update();
    // try {
    //   final changePasswordData = ChangePasswordRequestModel(
    //     password: confirmPasswordController.text.trim(),
    //   );

    //   await userAccountUseCase
    //       .getChangePasswordUseCase(changePasswordData)
    //       .then((value) async {
    //     print("contro....$value");
    //     if (value == "Password Changed Successfully" ||
    //         value == "Profile Data Updated Successfully") {
    //       SnackBarUtil.successSnackBar(value);
    //       getProfileDataController();
    //       refresh();
    //     } else {
    //       SnackBarUtil.errorSnackBar("Please try again.");
    //     }
    //   });
    //   loading.value = false;
    //   update();
    // } catch (e) {
    //   print(e);
    //   loading.value = false;
    // }
  }
}

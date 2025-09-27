import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/injector.dart';
import '../../../../utils/snack_bar.dart';
import '../../data/model/change_password_request_model.dart';
import '../../domain/use_cases/user_account_use_cases.dart';

class UserAccountController extends GetxController {
  var userAccountUseCase = getIt.get<UserAccountUsecase>();

  RxBool profilePicLoading = false.obs;
  RxBool loading = false.obs;

  RxBool currentPasswordVisibility = false.obs;
  RxBool newPasswordVisibility = false.obs;
  RxBool confirmPasswordVisibility = false.obs;
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  getChangePasswordController() async {
    loading.value = true;
    update();
    try {
      final changePasswordData = ChangePasswordRequestModel(
        newPassword: confirmPasswordController.text.trim(),
        oldPassword: currentPasswordController.text.trim(),
      );

      await userAccountUseCase
          .getChangePasswordUseCase(changePasswordData)
          .then((value) async {
        print("contro....$value");
        if (value == "Password Changed Successfully" ||
            value == "Profile Data Updated Successfully" ||
            value == "Password Updated Successfully") {
          SnackBarUtil.successSnackBar(value);
          refresh();
        } else {
          SnackBarUtil.errorSnackBar("Please try again.");
        }
      });
      loading.value = false;
      update();
    } catch (e) {
      print(e);
      loading.value = false;
    }
  }
}

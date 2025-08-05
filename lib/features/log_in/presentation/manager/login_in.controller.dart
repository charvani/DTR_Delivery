import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../../../../utils/snack_bar.dart';
import '../../../bottom_bar/presentation/pages/bottombar_screen.dart';
import '../../data/models/log_in_request.model.dart';
import '../../domain/use_cases/login_in.use_cases.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  RxBool loginPasswordVisibility = false.obs;
  RxBool passwordVisibility = false.obs;

  TextEditingController phonenumberController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  var getStore = getIt.get<GetStorage>();
  var logInUseCase = getIt.get<LogInUseCase>();

  getLogIn() async {
    try {
      loading.value = true;
      refresh();

      final logInRequestModel = LoginRequestModel(
        password: loginPasswordController.text.trim(),
        contactNumber: phonenumberController.text.trim(),
      );
      await logInUseCase
          .getLogInfoUseCase(logInRequestModel)
          .then((value) async {
        print("getting acces token>> ${value.accessToken}");
        getStore.write("accessToken", value.accessToken);
        getStore.write("contactNumber", value.contactNumber);
        getStore.write("firstName", value.firstName);
        // getStore.write("appLogin", "Yes");
        if (value.accessToken != null) {
          SnackBarUtil.successSnackBar("Succesfully Login");
          Get.offAll(() => BottomBarWidgetPage());
        }
      });
      loginPasswordController.clear();
      phonenumberController.clear();
      loading.value = false;
      update();
    } catch (e) {
      loading.value = false;
      update();
    }
  }
}

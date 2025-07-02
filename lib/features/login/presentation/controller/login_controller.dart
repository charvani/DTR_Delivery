import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loginPasswordVisibility = false.obs;
  RxBool loading = false.obs;

}

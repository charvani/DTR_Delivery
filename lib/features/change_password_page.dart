import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/appbar.dart';
import '../utils/common_colors.dart';
import '../utils/space_widget.dart';
import 'change_password_controller.dart';
import 'login/presentation/widgets/login_widgets.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final changePasswordController = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          title: "Change Password",
          backNavigation: true,
          actions: [],
          centerTitle: true),
      body: GetBuilder<ChangePasswordController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SpaceWidget(
                    height: 25,
                  ),
                  CustomTextfieldWidget(
                    obscureTextVal: !controller.newPasswordVisibility.value,
                    textEditingController: controller.newPasswordController,
                    hintText: "New Password",
                    keyboardType: TextInputType.name,
                    suffix: InkWell(
                        onTap: () {
                          print("onTappp");
                          controller.newPasswordVisibility.value =
                              !controller.newPasswordVisibility.value;
                          controller.update();
                        },
                        child: controller.newPasswordVisibility.value
                            ? Icon(
                                Icons.visibility,
                              )
                            : Icon(
                                Icons.visibility_off,
                              )),
                    validationFun: (String? value) {
                      bool hasLowercase = value!.contains(RegExp(r'[a-z]'));
                      bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
                      bool hasNumbers = value.contains(RegExp(r'[0-9]'));
                      bool hasSymbol = value.contains(RegExp(r'[!@#\$&*~]')); //
                      if (value.isEmpty) {
                        return "Please enter password";
                      } else if (value.length < 8) {
                        return ('Password must be at least 8 characters long.');
                      } else if (!hasLowercase) {
                        return 'Password must contain at least one lowercase letter.';
                      } else if (!hasUppercase) {
                        return 'Password must contain at least one uppercase letter.';
                      } else if (!hasNumbers) {
                        return 'Password must contain at least one number.';
                      } else if (!hasSymbol) {
                        return 'Password must contain at least one special character (e.g. !, @, #, \$, &).';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SpaceWidget(
                    height: 8,
                  ),
                  // Text(
                  //   "Confirm Password *",
                  //   //discuss regarding context..
                  //   style: Theme.of(context).textTheme.titleSmall,
                  // ),
                  SpaceWidget(
                    height: 8,
                  ),
                  CustomTextfieldWidget(
                    obscureTextVal: !controller.confirmPasswordVisibility.value,
                    textEditingController: controller.confirmPasswordController,
                    hintText: "Confirm Password",
                    keyboardType: TextInputType.name,
                    suffix: InkWell(
                        onTap: () {
                          controller.confirmPasswordVisibility.value =
                              !controller.confirmPasswordVisibility.value;
                          controller.update();
                        },
                        child: controller.confirmPasswordVisibility.value
                            ? Icon(
                                Icons.visibility,
                              )
                            : Icon(
                                Icons.visibility_off,
                              )),
                    validationFun: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter confirm password";
                      } else if (value !=
                          controller.newPasswordController.text) {
                        return "Passwords must be same";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SpaceWidget(
                    height: 100,
                  ),
                  // Obx(() {
                  //   return controller.loading.value
                  //       ? LoaderWidget()
                  //       :
                  FilledButton(
                    onPressed: () {
                      Get.focusScope?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        // controller.getChangePasswordController();
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(APPTHEME_COLOR)),
                    child: Text("SAVE"),
                  )
                  //         ;
                  // })
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

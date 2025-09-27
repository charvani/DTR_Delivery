import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/appbar.dart';
import '../../../../utils/common_colors.dart';
import '../../../../utils/common_textform_field.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/snack_bar.dart';
import '../../../../utils/space_widget.dart';
import '../manager/user_account_controller.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final UserAccountController controller = Get.put(UserAccountController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // _formKey.currentState!.reset();
    controller.confirmPasswordController.clear();
    controller.newPasswordController.clear();
    controller.currentPasswordController.clear();
    controller.update();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_BG_COLOR,
      appBar: appBarWidget(
          title: "Change Password",
          backNavigation: true,
          actions: [],
          centerTitle: true),

      // bottomNavigationBar: Obx(() {
      //   return SafeArea(
      //     child: controller.loading.value
      //         ? LoaderWidget()
      //         : Padding(
      //             padding: EdgeInsets.all(8.0.h),
      //             child: FilledButton(
      //               onPressed: () {
      //                 Get.focusScope?.unfocus();
      //                 if (_formKey.currentState!.validate()) {
      //                   if (controller.currentPasswordController.text.trim() ==
      //                       controller.newPasswordController.text.trim()) {
      //                     SnackBarUtil.errorSnackBar(
      //                         "Your new password cannot be the same as your current password. Please choose a different one.");
      //                   } else {
      //                     controller.getChangePasswordController();
      //                   }
      //                 }
      //               },
      //               style: ButtonStyle(
      //                   backgroundColor:
      //                       WidgetStatePropertyAll(APPTHEME_COLOR)),
      //               child: Text("SAVE"),
      //             ),
      //           ),
      //   );
      // }),

      body: SingleChildScrollView(
        child: GetBuilder<UserAccountController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SpaceWidget(
                        height: 25,
                      ),
                      CustomTextfieldWidget(
                        obscureTextVal:
                            !controller.currentPasswordVisibility.value,
                        textEditingController:
                            controller.currentPasswordController,
                        hintText: "Current Password",
                        keyboardType: TextInputType.name,
                        suffix: InkWell(
                            onTap: () {
                              print("onTappp");
                              controller.currentPasswordVisibility.value =
                                  !controller.currentPasswordVisibility.value;
                              controller.update();
                            },
                            child: controller.currentPasswordVisibility.value
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
                          bool hasSymbol =
                              value.contains(RegExp(r'[!@#\$&*~]')); //
                          if (value.isEmpty) {
                            return "Please enter current password";
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
                        height: 33,
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
                          bool hasSymbol =
                              value.contains(RegExp(r'[!@#\$&*~]')); //
                          if (value.isEmpty) {
                            return "Please enter new password";
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
                        height: 33,
                      ),
                      // Text(
                      //   "Confirm Password *",
                      //   //discuss regarding context..
                      //   style: Theme.of(context).textTheme.titleSmall,
                      // ),
                      // SpaceWidget(
                      //   height: 8,
                      // ),
                      CustomTextfieldWidget(
                        obscureTextVal:
                            !controller.confirmPasswordVisibility.value,
                        textEditingController:
                            controller.confirmPasswordController,
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
                            return "New password and confrim password must be same";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                  SpaceWidget(
                    height: 60,
                  ),
                  Obx(() {
                    return SafeArea(
                      child: controller.loading.value
                          ? LoaderWidget()
                          : FilledButton(
                              onPressed: () {
                                Get.focusScope?.unfocus();
                                if (_formKey.currentState!.validate()) {
                                  if (controller.currentPasswordController.text
                                          .trim() ==
                                      controller.newPasswordController.text
                                          .trim()) {
                                    SnackBarUtil.errorSnackBar(
                                        "Your new password cannot be the same as your current password. Please choose a different one.");
                                  } else {
                                    controller.getChangePasswordController();
                                  }
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(APPTHEME_COLOR)),
                              child: Text("SAVE"),
                            ),
                    );
                  }),
                  SpaceWidget(
                    height: 100,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

import 'package:dtr_delivery/utils/loader.dart';
import 'package:dtr_delivery/utils/square_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/appbar.dart';
import '../../../../utils/common_colors.dart';
import '../../../../utils/common_textform_field.dart';
import '../../../../utils/space_widget.dart';
import '../manager/login_in.controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          title: "Log In",
          backNavigation: false,
          actions: [],
          centerTitle: true),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 25.h,
        child: Center(
          child: Text(
            "v 1.0.0",
            style: TextStyle(
              fontFamily: "Medium",
              fontSize: 10.sp,
              color: APPTHEME_COLOR,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: GetBuilder<LoginController>(builder: (controller) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpaceWidget(
                    height: 30,
                  ),

                  Text(
                    "Your Phone Number *",
                    //discuss regarding context..
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SpaceWidget(
                    height: 8,
                  ),
                  CustomTextfieldWidget(
                    textEditingController: controller.phonenumberController,
                    hintText: "Enter phone number",
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    maxLengthEnforce: MaxLengthEnforcement.enforced,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validationFun: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter phone number";
                      } else if (value.length < 10) {
                        return "Enter valid phone number";
                      } else if (int.parse(value[0]) <= 5) {
                        return "Phone number can't start with or below 5";
                      } else {
                        return null;
                      }
                    },
                  ),
                  // !controller.loginWithOtp.value
                  //     ?

                  SpaceWidget(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password *",
                        //discuss regarding context..
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SpaceWidget(
                        height: 8,
                      ),
                      CustomTextfieldWidget(
                        obscureTextVal:
                            !controller.loginPasswordVisibility.value,
                        textEditingController:
                            controller.loginPasswordController,
                        hintText: "Enter your password",
                        keyboardType: TextInputType.name,
                        suffix: InkWell(
                            onTap: () {
                              controller.loginPasswordVisibility.value =
                                  !controller.loginPasswordVisibility.value;

                              controller.update();
                            },
                            child: controller.loginPasswordVisibility.value
                                ? Icon(
                                    Icons.visibility,
                                    color: APPTHEME_COLOR,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: APPTHEME_COLOR,
                                  )),
                        validationFun: (String? value) {
                          bool hasLowercase = value!.contains(RegExp(r'[a-z]'));
                          bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
                          bool hasNumbers = value.contains(RegExp(r'[0-9]'));
                          bool hasSymbol =
                              value.contains(RegExp(r'[!@#\$&*~]')); //
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
                    ],
                  ),
                  // : SizedBox.shrink(),
                  SpaceWidget(
                    height: 55,
                  ),
                  controller.loading.value
                      ? LoaderWidget()
                      : SquareActionButton(
                          buttonTitle: "Log in",
                          onTapFun: () {
                            Get.focusScope?.unfocus();
                            if (_formKey.currentState!.validate()) {
                              controller.getLogIn();
                              // Get.to(() => BottomBarWidgetPage());
                            }
                            // controller.update();
                          },
                        ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

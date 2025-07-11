//Textfield widget
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/common_colors.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChangedFun;
  final FormFieldValidator<String>? validationFun;
  final bool? obscureTextVal;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforce;
  final Widget? suffix;
  final Function()? onTapFun;
  final bool? readOnly;
  const CustomTextfieldWidget(
      {super.key,
      this.hintText,
      required this.textEditingController,
      this.keyboardType,
      this.inputFormatters,
      this.onChangedFun,
      required this.validationFun,
      this.obscureTextVal,
      this.maxLength,
      this.maxLengthEnforce,
      this.onTapFun,
      this.readOnly,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureTextVal ?? false,
      keyboardType: keyboardType ?? TextInputType.name,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //discuss regarding get...
      style: Get.textTheme.labelSmall,
      cursorColor: APPTHEME_COLOR,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforce,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
          hoverColor: APPTHEME_COLOR,
          hintText: hintText ?? "",
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: suffix,
          )),
      onChanged: onChangedFun,
      validator: validationFun,
      onTap: onTapFun,
    );
  }
}

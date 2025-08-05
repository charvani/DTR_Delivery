//Textfield widget
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_colors.dart';

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
  final TextCapitalization? textCapitalization;
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
      this.textCapitalization,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureTextVal ?? false,
      keyboardType: keyboardType ?? TextInputType.name,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      //discuss regarding get...

      style: TextStyle(fontSize: 14.sp, fontFamily: "SemiBold"),

      cursorColor: APPTHEME_COLOR,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforce,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.only(bottom: 10.h, left: 15.w),
          hoverColor: APPTHEME_COLOR,
          hintText: hintText ?? "",
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: suffix,
          )),
      onChanged: onChangedFun,
      validator: validationFun,
      onTap: onTapFun,
    );
  }
}

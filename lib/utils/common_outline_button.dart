import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlackOutlineButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTapFun;
  const BlackOutlineButton(
      {super.key, required this.buttonText, required this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: OutlinedButton(
        onPressed: onTapFun,
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: APPTHEME_COLOR), // Border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r), // Rounded corners
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 14.sp, color: APPTHEME_COLOR),
        ),
      ),
    );
  }
}

class RedOutlineButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTapFun;
  const RedOutlineButton(
      {super.key, required this.buttonText, required this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: OutlinedButton(
        onPressed: onTapFun,
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: INDICATION_COLOR), // Border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r), // Rounded corners
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 14.sp, color: INDICATION_COLOR),
        ),
      ),
    );
  }
}

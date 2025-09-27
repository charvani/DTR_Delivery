import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_opacity/with_opacity.dart';

TextStyle normalTextStyle =
    TextStyle(color: Color(0xff63706F), fontSize: 13.sp, fontFamily: "Medium");
TextStyle headingStyle =
    TextStyle(color: Color(0xff000000), fontFamily: "Medium", fontSize: 18.sp);
TextStyle subHeadingStyle =
    TextStyle(color: Color(0xff000000), fontFamily: "Medium", fontSize: 16.sp);
TextStyle hilightTextStyle =
    TextStyle(color: Colors.black, fontFamily: "SemiBold");

Widget bulletPoint(String text, {String? highlight, bool? dot, bool? heading}) {
  if (highlight != null && text.contains(highlight)) {
    final parts = text.split(highlight);
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dot == false
              ? SizedBox.shrink()
              : Text("• ", style: TextStyle(fontSize: 16.sp)),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Color(0xff63706F),
                ),
                children: [
                  TextSpan(text: parts[0], style: TextStyle(fontSize: 14.sp)),
                  TextSpan(
                    text: highlight,
                    style: TextStyle(
                        // color: BLUE_COLOR,
                        color: Colors.black87,
                        fontFamily: "SemiBold",
                        fontSize: 14.sp),
                  ),
                  TextSpan(
                      text: parts.length > 1 ? parts[1] : '',
                      style: TextStyle(
                          color: Color(0xff63706F),
                          fontSize: 13.sp,
                          fontFamily: "Medium")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dot == false
            ? SizedBox.shrink()
            : Text("• ", style: TextStyle(fontSize: 16.sp)),
        Expanded(
            child: Text(text,
                style: heading == true
                    ? TextStyle(
                        color: Colors.black87.withCustomOpacity(0.7),
                        fontSize: 14.sp,
                        fontFamily: "SemiBold")
                    : TextStyle(
                        color: Color(0xff63706F),
                        fontSize: 13.sp,
                        fontFamily: "Medium")))
      ],
    ),
  );
}

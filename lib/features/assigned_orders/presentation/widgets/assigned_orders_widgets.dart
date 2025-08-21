import 'package:dtr_delivery/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_opacity/with_opacity.dart';

import '../../../../utils/common_colors.dart';

class MarkAttendanceWidget extends StatelessWidget {
  final String title;
  final ValueChanged<dynamic>? onChangedFun;
  final ValueNotifier<bool>? controller;
  final bool initialVal;
  final bool loader;
  const MarkAttendanceWidget(
      {super.key,
      required this.loader,
      required this.title,
      required this.controller,
      required this.onChangedFun,
      required this.initialVal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 20,
      // horizontalTitleGap: 20,
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      // leading: Image.asset(image, height: 20),
      trailing: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: loader
            ? SizedBox(height: 20.h, width: 20.w, child: LoaderWidget())
            : AdvancedSwitch(
                initialValue: initialVal,
                controller: controller,
                onChanged: onChangedFun,
                inactiveColor: Color(0xFFDCDCE0),
                activeColor: GREEN_COLOR,
                width: 52.w,
                height: 24.h,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
              ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: APPTHEME_COLOR,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

attandanceDialogFun({
  required void Function()? noFunction,
  required void Function()? yesFunction,
}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.r)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(30.w, 25.h, 30.w, 30.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Do you want to Punch Out?",
              style: TextStyle(
                fontFamily: "Medium",
                color: APPTHEME_COLOR,
                fontSize: 20.sp,
                // height: .h
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              "Note: Once you punch out now, your attendance for today will be marked as complete.",
              style: TextStyle(color: INDICATION_COLOR),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: yesFunction,
                  child: Text(
                    "YES",
                    style: TextStyle(
                      fontFamily: "Medium",
                      fontSize: 22.sp,
                      color: REDAPPTHEME_COLOR,
                    ),
                  ),
                ),
                Container(
                    height: 35.h,
                    width: 1.w,
                    color: const Color(0xff787878).withCustomOpacity(0.20)),
                TextButton(
                  onPressed: noFunction,
                  child: Text(
                    "NO",
                    style: TextStyle(
                      fontFamily: "Medium",
                      fontSize: 22.sp,
                      color: Color(0xff787878),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

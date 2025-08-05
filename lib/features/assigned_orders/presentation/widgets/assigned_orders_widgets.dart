import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/common_colors.dart';

class MarkAttendanceWidget extends StatelessWidget {
  final String title;
  final ValueChanged<dynamic>? onChangedFun;
  final ValueNotifier<bool>? controller;
  final bool initialVal;
  const MarkAttendanceWidget(
      {super.key,
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
        child: AdvancedSwitch(
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

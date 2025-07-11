import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_colors.dart';

appBarWidget({
  required String title,
  required bool backNavigation,
  required List<Widget> actions,
  required bool centerTitle,
  leadingAction,
  bottom,
  color,
}) {
  return AppBar(
    centerTitle: centerTitle,
    leadingWidth: !backNavigation ? 0 : 56,
    backgroundColor: color,
    actions: actions,
    leading: backNavigation
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.keyboard_backspace_rounded,
                )
                // CircleAvatar(
                // backgroundColor: WHITE_BG_COLOR,
                // child: Icon(
                //   Icons.keyboard_backspace_rounded,
                // color: REDAPPTHEME_COLOR,
                //   size: 16,
                // ),
                // ),
                ),
          )
        // IconButton(
        //     disabledColor: Colors.amber,
        //     onPressed: () {
        //       print("cherry");
        //       Get.back();
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios_new_rounded,
        //       color: REDAPPTHEME_COLOR,
        //       size: 17,
        //     ))
        : SizedBox.shrink(),
    bottom: bottom,
    title: Text(
      title,
      style: TextStyle(
          color: APPTHEME_COLOR, fontSize: 18, fontFamily: "SemiBold"),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_colors.dart';

class CloseWidget extends StatelessWidget {
  final Function() closeFun;
  const CloseWidget({super.key, required this.closeFun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: closeFun,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 15.r,
        child: Icon(
          Icons.close,
          size: 20.h,
          color: APPTHEME_COLOR,
        ),
      ),
    );
  }
}

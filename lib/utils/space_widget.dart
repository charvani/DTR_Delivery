// To give space between widgets
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceWidget extends StatelessWidget {
  final double? height, width;
  const SpaceWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != null ? height!.h : height,
      width: width != null ? width!.h : width,
    );
  }
}

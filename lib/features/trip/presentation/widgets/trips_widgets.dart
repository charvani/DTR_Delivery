import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/common_colors.dart';

/// Reusable header delegate for pinned headers
class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

Widget containerCard({required List<Widget> children}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      color: LIGHT_BLACK_SHADE_COLOR,
    ),
    child: Column(children: children),
  );
}

Widget tripDetailsRow(String label, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Get.textTheme.titleSmall),
        Text(value, style: Get.textTheme.titleSmall),
      ],
    ),
  );
}

Widget buildInvoiceRow(String item, String price) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item, style: Get.textTheme.titleSmall),
        RichText(
          text: TextSpan(
            text: "₹",
            style: TextStyle(color: BLACK_TEXT_COLOR),
            children: [
              TextSpan(text: price, style: Get.textTheme.titleSmall),
            ],
          ),
        ),
      ],
    ),
  );
}

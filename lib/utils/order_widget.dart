import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common_colors.dart';
import 'space_widget.dart';

class OrderWidget extends StatelessWidget {
  final String customerName;
  final String customerMobileNumber;
  final Function()? onTapFun;
  final String order;
  final String location;
  const OrderWidget(
      {super.key,
      required this.customerMobileNumber,
      required this.customerName,
      required this.onTapFun,
      required this.order,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapFun,
      leading: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            color: LIGHT_BLACK_SHADE_COLOR),
        child: Padding(
          padding: EdgeInsets.all(10.0.h),
          child: Image.asset(
            "assets/images/order_box.png",
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer: $customerName",
            style: Get.textTheme.titleSmall!.copyWith(color: BLACK_TEXT_COLOR2),
          ),
          Text(
            "Order: $order",
            style: Get.textTheme.labelSmall,
          ),
          // Text(
          //   "Invoice: #1234",
          //   style: Get.textTheme.labelSmall,
          // ),
        ],
      ),
      trailing: SizedBox(
        width: 50.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (customerMobileNumber != "")
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  makePhoneCall(customerMobileNumber);
                },
                child: Icon(
                  Icons.call,
                  size: 20.h,
                ),
              ),
            SpaceWidget(
              width: 10,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                locationRoute(location);
              },
              child: Icon(
                Icons.location_on,
                size: 20.h,
                color: GREEN_COLOR,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void makePhoneCall(String phoneNumber) async {
  final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(callUri)) {
    await launchUrl(callUri);
  } else {
    throw 'Could not launch $callUri';
  }
}

void locationRoute(String totalAddress) async {
  print("address des ...$totalAddress");
  // final String origin = "Vizag Railway Station, Visakhapatnam";
  // final String waypoint1 = "Kailasagiri, Visakhapatnam";
  // final String destination = "RK Beach, Visakhapatnam";

  // final String googleMapsUrl = "https://www.google.com/maps/dir/?api=1"
  //     "&origin=${Uri.encodeComponent(origin)}"
  //     "&destination=${Uri.encodeComponent(destination)}"
  //     "&waypoints=${Uri.encodeComponent(waypoint1)}";

  final query = Uri.encodeComponent(totalAddress);
  final googleMapsUrl =
      "https://www.google.com/maps/search/?api=1&query=$query";

  if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
    await launchUrl(Uri.parse(googleMapsUrl),
        mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch Google Maps';
  }
}

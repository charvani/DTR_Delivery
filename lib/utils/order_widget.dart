import 'package:dtr_delivery/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common_colors.dart';
import 'location_fetch.dart';
import 'space_widget.dart';

class OrderWidget extends StatelessWidget {
  final String customerName;
  final String customerMobileNumber;
  final Function()? onTapFun;
  final String order;
  final String location;
  final dynamic latitude;
  final dynamic longitude;
  final String statusOfOrder;
  const OrderWidget(
      {super.key,
      required this.customerMobileNumber,
      required this.customerName,
      required this.onTapFun,
      required this.order,
      required this.latitude,
      required this.longitude,
      required this.statusOfOrder,
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
          if (statusOfOrder != "")
            Card(
              color: statusOfOrder.toLowerCase() == "ordered"
                  ? ORDERED_COLOR
                  : statusOfOrder.toLowerCase() == "packing started" ||
                          statusOfOrder.toLowerCase() == "out for delivery"
                      ? PACKING_ORDER_COLOR
                      : statusOfOrder.toLowerCase() == "cancelled"
                          ? REDAPPTHEME_COLOR
                          : DISPATCHED_COLOR,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                child: Text(
                  "Status: $statusOfOrder",
                  style: Get.textTheme.labelSmall!.copyWith(color: WHITE_COLOR),
                ),
              ),
            ),
        ],
      ),
      trailing: SizedBox(
        width: 60.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (customerMobileNumber != "")
              InkWell(
                // behavior: HitTestBehavior.translucent,
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
            InkWell(
              // behavior: HitTestBehavior.translucent,
              onTap: () {
                singleLocationRoute(
                    totalAddress: location,
                    latitude: latitude,
                    longitude: longitude);
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
    SnackBarUtil.errorSnackBar("Unable to call $phoneNumber customer");
    throw 'Could not launch $callUri';
  }
}

void singleLocationRoute(
    {required totalAddress, required latitude, required longitude}) async {
  print("address des ...$totalAddress");
  // final String origin = "Vizag Railway Station, Visakhapatnam";
  // final String waypoint1 = "Kailasagiri, Visakhapatnam";
  // final String destination = "RK Beach, Visakhapatnam";

  // final String googleMapsUrl = "https://www.google.com/maps/dir/?api=1"
  //     "&origin=${Uri.encodeComponent(origin)}"
  //     "&destination=${Uri.encodeComponent(destination)}"
  //     "&waypoints=${Uri.encodeComponent(waypoint1)}";
  if (latitude != null && longitude != null) {
    final googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    final uri = Uri.parse(googleMapsUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch Google Maps';
    }
  } else {
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
}

doubleLocationRoute(
    {required totalAddress, required latitude, required longitude}) async {
  print("address des ...$totalAddress");
  await LocationFetch().getCurrentLocation().then((val) async {
    if (val != null) {
      print("get add >> $val");
      String agentAddress =
          "${val.address1}${val.address2}${val.city}${val.state}${val.postalCode}";

      final agentQuery = Uri.encodeComponent(agentAddress);
      final userQuery = Uri.encodeComponent(totalAddress);
      final googleMapsUrl = "https://www.google.com/maps/dir/?api=1"
          "&origin=$agentQuery"
          "&destination=$userQuery"
          "&travelmode=driving";
      if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
        await launchUrl(Uri.parse(googleMapsUrl),
            mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch Google Maps';
      }
    }
  });
}

/*
doubleLocationRoute(
    {required totalAddress, required latitude, required longitude}) async {
  print("address des ...$totalAddress");
  Position agentPosition = await LocationService.getCurrentLocation();
  print(
      "gettig positi ...${agentPosition.latitude}...${agentPosition.longitude}");

  if (latitude != null && longitude != null) {
    // final googleMapsUrl =
    // "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    final googleMapsUrl = "https://www.google.com/maps/dir/?api=1"
        "&origin=${agentPosition.latitude},${agentPosition.longitude}"
        "&destination=$latitude,$longitude"
        "&travelmode=driving";

    final uri = Uri.parse(googleMapsUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch Google Maps';
    }
  } else {
    // final query = Uri.encodeComponent(totalAddress);
    // final googleMapsUrl =
    //     "https://www.google.com/maps/search/?api=1&query=$query";
    final query = Uri.encodeComponent(totalAddress);

    final googleMapsUrl = "https://www.google.com/maps/dir/?api=1"
        "&origin=$agentPosition,$agentPosition"
        "&destination=$query"
        "&travelmode=driving";

    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl),
          mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch Google Maps';
    }
  }
}
*/

import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../manager/trip_controller.dart';
import 'trip_order_details_screen.dart';

class PrevioursTripsScreen extends StatefulWidget {
  const PrevioursTripsScreen({super.key});

  @override
  State<PrevioursTripsScreen> createState() => _PrevioursTripsScreenState();
}

class _PrevioursTripsScreenState extends State<PrevioursTripsScreen> {
  final TripController controller = Get.put(TripController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.getPreviousTripsController();

      getPreviousTripsScrollListener();
    });
  }

  getPreviousTripsScrollListener() {
    print("at listnerqqqqq");

    controller.previousTripsListScrollController.addListener(() {
      print("at listner");
      if (controller.previousTripsListScrollController.position.pixels ==
          controller
              .previousTripsListScrollController.position.maxScrollExtent) {
        print("at listner 333333");
        Future.delayed(Duration(seconds: 1), () {
          controller.getPreviousTripsController();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
            title: "Previous Trips",
            backNavigation: true,
            actions: [],
            centerTitle: true),
        body: GetBuilder<TripController>(builder: (context) {
          return previousTripsWidget();
        }));
  }

  previousTripsWidget() {
    return Obx(() {
      return controller.loading.value
          ? LoaderWidget()
          : Column(
              children: [
                controller.previousTripsList.isEmpty
                    ? SizedBox(
                        height: 700.h,
                        child: Center(
                          child: Text("Previous Trips not available",
                              style: Get.textTheme.titleSmall),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            controller:
                                controller.previousTripsListScrollController,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: controller.previousTripsList.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                onTap: () {
                                  Get.to(() => TripOrderDetailsScreen(
                                        // type: i.isEven ? "delivered" : "",
                                        orderId: "",
                                      ));
                                },
                                leading: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.r),
                                      color: LIGHT_BLACK_SHADE_COLOR),
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0.h),
                                    child: Image.asset(
                                      "assets/images/trip2.png",
                                    ),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Vehicle Name: ${controller.previousTripsList[i].vehicleName}",
                                      style: Get.textTheme.titleSmall!
                                          .copyWith(color: BLACK_TEXT_COLOR2),
                                    ),
                                    Text(
                                      "Trip Id: ${controller.previousTripsList[i].tripId}",
                                      style: Get.textTheme.labelSmall,
                                    ),
                                    Text(
                                      "Orders Count: ${controller.previousTripsList[i].totalOrders}",
                                      style: Get.textTheme.labelSmall,
                                    ),
                                    Text(
                                      "Delivered Count: ${controller.previousTripsList[i].totalOrdersDelivered}",
                                      style: Get.textTheme.labelSmall,
                                    ),
                                  ],
                                ),
                                trailing: SizedBox(
                                  width: 45.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 18.r,
                                        color: LIGHT_LINE_COLOR,
                                        // color: GREEN_COLOR,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                controller.paginationLoading.value
                    ? LoaderWidget()
                    : SizedBox.shrink()
              ],
            );
    });
  }
}

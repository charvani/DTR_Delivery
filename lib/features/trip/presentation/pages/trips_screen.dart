import 'package:dtr_delivery/features/trip/presentation/pages/previours_trips_screen.dart';
import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/loader.dart';
import 'package:dtr_delivery/utils/space_widget.dart';
import 'package:dtr_delivery/utils/square_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../main.dart';
import '../../../../utils/snack_bar.dart';
import '../manager/trip_controller.dart';
import '../widgets/trips_widgets.dart';
import 'trip_order_details_screen.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  final TripController controller = Get.put(TripController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      dynamic val = await getStore.read(
        "punch",
      );
      print("punn....$val");
      controller.punch.value = val;
      controller.previousTrips = false;
      controller.update();
      if (val == "notpunched") {
        SnackBarUtil.errorSnackBar("Please punch in");
      } else {
        controller.getCurrentTripController();
        // getPreviousTripsScrollListener();
      }
    });
  }

  // getPreviousTripsScrollListener() {
  //   print("at listnerqqqqq");

  //   controller.previousTripsListScrollController.addListener(() {
  //     print("at listner");
  //     if (controller.previousTripsListScrollController.position.pixels ==
  //         controller
  //             .previousTripsListScrollController.position.maxScrollExtent) {
  //       print("at listner 333333");
  //       Future.delayed(Duration(seconds: 1), () {
  //         controller.getPreviousTripsController();
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
            title: "Trips",
            backNavigation: false,
            actions: [
              OutlinedButton(
                onPressed: () {
                  if (controller.punch.value != "notpunched") {
                    Get.to(() => PrevioursTripsScreen());
                  } else {
                    SnackBarUtil.errorSnackBar("Please punch in");
                  }
                },
                style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(120.w, 30.h)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8.r))),
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 0))),
                child: Text("Previous Trips"),
              ),
              SpaceWidget(
                width: 5,
              )
            ],
            centerTitle: true),
        body: GetBuilder<TripController>(builder: (context) {
          return controller.punch.value == "notpunched"
              ? Center(
                  child: Text("Please punch In",
                      style: Get.textTheme.titleSmall!
                          .copyWith(color: INDICATION_COLOR)),
                )
              :
              // controller.currentTripList.isNotEmpty &&
              //         (controller.previousTrips == false)
              //     ?
              tripWidget();
          // : previousTripsWidget();
        }));
  }

  tripWidget() {
    return controller.loading.value
        ? LoaderWidget()
        : controller.currentTripList.isEmpty
            ? Center(
                child: Text("Current Trip not available",
                    style: Get.textTheme.titleSmall),
              )
            : CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverHeaderDelegate(
                      minHeight: 50,
                      maxHeight: 60,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 0.h),
                        alignment: Alignment.centerLeft,
                        child: controller.currentTripList.isNotEmpty
                            ? Text(
                                "TRIP ID: ${controller.currentTripList[0].tripId}",
                                style: Get.textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold))
                            : Text("TRIP ID:"),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Vehicle Details:",
                              style: Get.textTheme.titleMedium),
                          SpaceWidget(height: 5.h),
                          containerCard(
                            children: [
                              tripDetailsRow("Vehicle Name",
                                  controller.currentTripList[0].vehcileName!),
                              tripDetailsRow("Vehicle Number",
                                  controller.currentTripList[0].vehicleNumber!),
                            ],
                          ),
                          SpaceWidget(height: 20),
                          Text("Order Details:",
                              style: Get.textTheme.titleMedium),
                          SpaceWidget(height: 5),
                          containerCard(
                            children: [
                              tripDetailsRow("Orders Count",
                                  controller.currentTripList.length.toString()),
                              tripDetailsRow(
                                  "Delivered Count",
                                  controller
                                          .currentTripList[0].deliveredOrder ??
                                      "0"),
                              buildInvoiceRow(
                                  "Order Total",
                                  controller.currentTripList[0].orderTotal
                                      .toString()),
                              buildInvoiceRow(
                                  "Amount Collected",
                                  controller
                                          .currentTripList[0].amountCollected ??
                                      "0"),
                            ],
                          ),
                          SpaceWidget(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverHeaderDelegate(
                      minHeight: 45,
                      maxHeight: 45,
                      child: Container(
                        color: WHITE_COLOR,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 0.h),
                        alignment: Alignment.centerLeft,
                        child:
                            Text("Orders:", style: Get.textTheme.titleMedium),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.currentTripList.length,
                      (context, i) => ListTile(
                        onTap: () => Get.to(() => TripOrderDetailsScreen(
                              orderId: controller.currentTripList[i].orderId!,
                            )),
                        leading: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            color: LIGHT_BLACK_SHADE_COLOR,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0.h),
                            child: Image.asset("assets/images/order_box.png"),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Customer: ${controller.currentTripList[i].customerName}",
                                style: Get.textTheme.titleSmall!
                                    .copyWith(color: BLACK_TEXT_COLOR2)),
                            Text(
                                "Order: ${controller.currentTripList[i].orderId}",
                                style: Get.textTheme.labelSmall),
                            // Text("Invoice: #1234", style: Get.textTheme.labelSmall),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 45.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.call, size: 20.h),
                              SpaceWidget(width: 5),
                              Icon(Icons.location_on,
                                  size: 20.h, color: GREEN_COLOR),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16.h),
                      child: Column(
                        children: [
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             const Text(
                          //               "Delivery orders were followed as assigned",
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.w500, fontSize: 12),
                          //             ),
                          //             InkWell(
                          //               onTap: () => setState(() => isChecked = !isChecked),
                          //               child: Container(
                          //                 width: 24,
                          //                 height: 24,
                          //                 decoration: BoxDecoration(
                          //                   color: !isChecked ? Colors.red[100] : GREEN_COLOR,
                          //                 ),
                          //                 child: Center(
                          //                   child: !isChecked
                          //                       ? Icon(Icons.close,
                          //                           size: 18, color: INDICATION_COLOR)
                          //                       : Icon(Icons.done,
                          //                           color: WHITE_COLOR, size: 18),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          // if (!isChecked) ...[
                          //   const SizedBox(height: 10),
                          //   Text(
                          //     "Deviation Reason*",
                          //     style: Theme.of(context).textTheme.titleSmall,
                          //   ),
                          //   const SizedBox(height: 8),
                          //   Multilinetextfield(
                          //     textEditingController: reasonController,
                          //     maxlines: 5,
                          //     hintText:
                          //         "Enter the reason for order sequence not followed",
                          //     keyboardType: TextInputType.name,
                          //     validationFun: (String? value) {
                          //       if (value!.isEmpty) {
                          //         return "Please enter reason";
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          //   const SizedBox(height: 8),
                          //   SquareActionButton(
                          //     buttonTitle: "Submit",
                          //     onTapFun: () {
                          //       // Save or handle reason
                          //     },
                          //   ),
                          // ],
                          SpaceWidget(height: 20),
                          SquareActionButton(
                            buttonTitle: "Trip Route",
                            onTapFun: () async {
                              final String origin =
                                  "Vizag Railway Station, Visakhapatnam";
                              final String waypoint1 =
                                  "Kailasagiri, Visakhapatnam";
                              final String destination =
                                  "RK Beach, Visakhapatnam";

                              final String googleMapsUrl =
                                  "https://www.google.com/maps/dir/?api=1"
                                  "&origin=${Uri.encodeComponent(origin)}"
                                  "&destination=${Uri.encodeComponent(destination)}"
                                  "&waypoints=${Uri.encodeComponent(waypoint1)}";

                              if (await canLaunchUrl(
                                  Uri.parse(googleMapsUrl))) {
                                await launchUrl(Uri.parse(googleMapsUrl),
                                    mode: LaunchMode.externalApplication);
                              } else {
                                throw 'Could not launch Google Maps';
                              }
                            },
                          ),
                          SpaceWidget(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              );
  }
}

import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/loader.dart';
import 'package:dtr_delivery/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/order_widget.dart';
import '../manager/trip_controller.dart';
import '../widgets/trips_widgets.dart';
import 'previous_trips_order_details_screen.dart';

class PreviousTripsDetailsScreen extends StatefulWidget {
  final String tripId;
  const PreviousTripsDetailsScreen({super.key, required this.tripId});

  @override
  State<PreviousTripsDetailsScreen> createState() =>
      _PreviousTripsDetailsScreenState();
}

class _PreviousTripsDetailsScreenState
    extends State<PreviousTripsDetailsScreen> {
  final TripController controller = Get.put(TripController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.getPreviousTripDetailsController(tripId: widget.tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
            title: "Previous Trip",
            backNavigation: true,
            actions: [],
            centerTitle: true),
        body: SafeArea(
          child: GetBuilder<TripController>(builder: (context) {
            return controller.punch.value == "notpunched"
                ? Center(
                    child: Text("Please punch In",
                        style: Get.textTheme.titleSmall!
                            .copyWith(color: INDICATION_COLOR)),
                  )
                :
                // controller.previousTripOrdersList.isNotEmpty &&
                //         (controller.previousTrips == false)
                //     ?
                tripWidget();
            // : previousTripsWidget();
          }),
        ));
  }

  tripWidget() {
    return controller.loading.value
        ? LoaderWidget()
        : controller.previousTripOrdersList.isEmpty
            ? Center(
                child: Text("Previous Trips not available",
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
                        child: controller.previousTripOrdersList.isNotEmpty
                            ? Text(
                                "TRIP ID: ${controller.previousTripOrdersList[0].tripId}",
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
                              tripDetailsRow(
                                  "Vehicle Name",
                                  controller
                                      .previousTripOrdersList[0].vehcileName!),
                              tripDetailsRow(
                                  "Vehicle Number",
                                  controller.previousTripOrdersList[0]
                                      .vehicleNumber!),
                            ],
                          ),
                          SpaceWidget(height: 20),
                          Text("Order Details:",
                              style: Get.textTheme.titleMedium),
                          SpaceWidget(height: 5),
                          containerCard(
                            children: [
                              tripDetailsRow(
                                  "Orders Count",
                                  controller.previousTripOrdersList.length
                                      .toString()),
                              tripDetailsRow(
                                  "Delivered Count",
                                  controller.previousTripOrdersList[0]
                                          .ordersDelivered
                                          .toString() ??
                                      "0"),
                              buildInvoiceRow(
                                  "Trip Orders Total",
                                  double.parse(controller.previousTripOrderTotal
                                          .toString())
                                      .toStringAsFixed(2)),
                              // buildInvoiceRow(
                              //     "Amount Collected",
                              //     controller
                              //         .previousTripOrdersList[0].amountCollected
                              //         .toString()),
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
                        childCount: controller.previousTripOrdersList.length,
                        (context, i) => OrderWidget(
                              customerMobileNumber: controller
                                  .previousTripOrdersList[i].customerPhone,
                              customerName: controller
                                  .previousTripOrdersList[i].customerName,
                              onTapFun: () {
                                Get.to(() => PreviousTripsOrderDetailsScreen(
                                      orderId: controller
                                          .previousTripOrdersList[i].orderId!,
                                    ));
                              },
                              order:
                                  controller.previousTripOrdersList[i].orderId,
                              statusOfOrder: controller
                                  .previousTripOrdersList[i].status
                                  .toString()
                                  .capitalizeFirst!,
                              latitude: controller
                                  .previousTripOrdersList[i].address!.latitude,
                              longitude: controller
                                  .previousTripOrdersList[i].address!.longitude,
                              location:
                                  "${controller.previousTripOrdersList[i].address!.address1},${controller.previousTripOrdersList[i].address!.address2},${controller.previousTripOrdersList[i].address!.city},${controller.previousTripOrdersList[i].address!.state},${controller.previousTripOrdersList[i].address!.postalCode}",
                            )

                        // ListTile(
                        //   onTap:
                        //       //  () {},
                        //       () => Get.to(() => PreviousTripsOrderDetailsScreen(
                        //             orderId: controller
                        //                 .previousTripOrdersList[i].orderId!,
                        //           )),
                        //   leading: Container(
                        //     margin: EdgeInsets.symmetric(vertical: 8.h),
                        //     height: 50.h,
                        //     width: 50.w,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(3.r),
                        //       color: LIGHT_BLACK_SHADE_COLOR,
                        //     ),
                        //     child: Padding(
                        //       padding: EdgeInsets.all(10.0.h),
                        //       child: Image.asset("assets/images/order_box.png"),
                        //     ),
                        //   ),
                        //   title: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //           "Customer: ${controller.previousTripOrdersList[i].customerName}",
                        //           style: Get.textTheme.titleSmall!
                        //               .copyWith(color: BLACK_TEXT_COLOR2)),
                        //       Text(
                        //           "Order: ${controller.previousTripOrdersList[i].orderId}",
                        //           style: Get.textTheme.labelSmall),
                        //       Text(
                        //           "Status: ${controller.previousTripOrdersList[i].status.toString().capitalizeFirst}",
                        //           style: Get.textTheme.labelSmall),
                        //     ],
                        //   ),
                        //   trailing: SizedBox(
                        //     width: 45.w,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       children: [
                        //         Icon(Icons.call, size: 20.h),
                        //         SpaceWidget(width: 5),
                        //         Icon(Icons.location_on,
                        //             size: 20.h, color: GREEN_COLOR),
                        //       ],
                        //     ),
                        //   ),
                        // ),
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
                          // SquareActionButton(
                          //   buttonTitle: "Trip Route",
                          //   onTapFun: () async {
                          //     final String origin =
                          //         "Vizag Railway Station, Visakhapatnam";
                          //     final String waypoint1 =
                          //         "Kailasagiri, Visakhapatnam";
                          //     final String destination =
                          //         "RK Beach, Visakhapatnam";

                          //     final String googleMapsUrl =
                          //         "https://www.google.com/maps/dir/?api=1"
                          //         "&origin=${Uri.encodeComponent(origin)}"
                          //         "&destination=${Uri.encodeComponent(destination)}"
                          //         "&waypoints=${Uri.encodeComponent(waypoint1)}";

                          //     if (await canLaunchUrl(
                          //         Uri.parse(googleMapsUrl))) {
                          //       await launchUrl(Uri.parse(googleMapsUrl),
                          //           mode: LaunchMode.externalApplication);
                          //     } else {
                          //       throw 'Could not launch Google Maps';
                          //     }
                          //   },
                          // ),
                          SpaceWidget(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              );
  }
}

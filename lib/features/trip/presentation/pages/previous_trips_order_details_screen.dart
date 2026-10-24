import 'package:dtr_delivery/features/order_details/presentation/manager/order_details_controller.dart';
import 'package:dtr_delivery/features/trip/presentation/manager/trip_controller.dart';
import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/loader.dart';
import 'package:dtr_delivery/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_opacity/with_opacity.dart';

import '../../../../utils/close_widget.dart';
import '../../../../utils/custom_action_button.dart';
import '../../../../utils/multiLineTextField.dart';
import '../../../../utils/order_widget.dart';
import '../widgets/trips_widgets.dart';

class PreviousTripsOrderDetailsScreen extends StatefulWidget {
  final String orderId;
  const PreviousTripsOrderDetailsScreen({
    super.key,
    required this.orderId,
  });

  @override
  State<PreviousTripsOrderDetailsScreen> createState() =>
      _PreviousTripsOrderDetailsScreenState();
}

class _PreviousTripsOrderDetailsScreenState
    extends State<PreviousTripsOrderDetailsScreen> {
  final OrderDetailsController controller = Get.put(OrderDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initFun();
    });
  }

  initFun() {
    print("order id ...${widget.orderId}");
    controller.orderId = widget.orderId;
    controller.update();
    controller.getOrderDetailsController("orderDetailsInit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          title: 'Order Details',
          backNavigation: true,
          actions: [],
          centerTitle: true),
      body: SafeArea(
        child: GetBuilder<OrderDetailsController>(builder: (controller) {
          return controller.loading.value
              ? LoaderWidget()
              : SingleChildScrollView(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          controller.orderDetailsData.order != null
                              ? "Order ID: ${controller.orderDetailsData.order!.id}"
                              : "",
                          style: Get.textTheme.titleLarge),
                      SpaceWidget(height: 12),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 32.r,
                            backgroundColor: LIGHT_BLACK_SHADE_COLOR,
                            child: Icon(
                              Icons.person_2_outlined,
                              color: BLACK_COLOR,
                            ),
                            // Replace with actual image asset
                          ),
                          SpaceWidget(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller.orderDetailsData.user != null
                                        ? "Customer: ${controller.orderDetailsData.user!.firstName} ${controller.orderDetailsData.user!.lastName}"
                                        : "",
                                    style: Get.textTheme.titleMedium),
                                Text(
                                    controller.orderDetailsData.address != null
                                        ? "${controller.orderDetailsData.address!.address1}, ${controller.orderDetailsData.address!.address2}, ${controller.orderDetailsData.address!.city}, ${controller.orderDetailsData.address!.state}, ${controller.orderDetailsData.address!.postalCode}."
                                        : "",
                                    style: Get.textTheme.labelSmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SpaceWidget(height: 10),
                      Row(
                        children: [
                          Container(
                            height: 50.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: LIGHT_BLACK_SHADE_COLOR),
                            child: Padding(
                              padding: EdgeInsets.all(8.0.h),
                              child: Icon(Icons.call_outlined),
                            ),
                          ),
                          SpaceWidget(
                            width: 10,
                          ),
                          Text(
                              controller.orderDetailsData.user != null
                                  ? "Contact: +91 ${controller.orderDetailsData.user!.mobileNumber}"
                                  : "",
                              style: Get.textTheme.titleMedium),
                        ],
                      ),
                      SpaceWidget(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order Details",
                              style: Get.textTheme.titleLarge),
                          // returnSelected
                          //     ? SizedBox(
                          //         width: 120.w,
                          //         child: RedOutlineButton(
                          //           buttonText: "Return",
                          //           onTapFun: () {
                          //             returnSelected = !returnSelected;
                          //             setState(() {});
                          //           },
                          //         ),
                          //       )
                          //     : BlackOutlineButton(
                          //         buttonText: "Select for Return",
                          //         onTapFun: () {
                          //           returnSelected = !returnSelected;
                          //           setState(() {});
                          //         },
                          //       )
                        ],
                      ),
                      SpaceWidget(height: 10),
                      _buildInvoiceHeadingRow(),
                      SpaceWidget(height: 10),
                      if (controller.orderDetailsData.orderDetails != null)
                        for (int i = 0;
                            i <
                                controller
                                    .orderDetailsData.orderDetails!.length;
                            i++)
                          _buildInvoiceRow(
                              controller.orderDetailsData.orderDetails![i]
                                  .productName!,
                              controller
                                  .orderDetailsData.orderDetails![i].quantity!,
                              controller
                                  .orderDetailsData.orderDetails![i].price!),

                      Divider(
                        height: 30.h,
                        color: LIGHT_BLACK_SHADE_COLOR,
                      ),
                      // _buildSummaryRow(
                      //     "Total Amount", controller.totalWithoutGst),
                      // _buildSummaryRow("Gst",
                      //     controller.totalWithGst - controller.totalWithoutGst),
                      // _discountTotalRow(controller.discountAmount,
                      //     controller.discountPercentage),
                      // // _buildSummaryRow("Total Before Tax", "4166.67"),
                      // _buildSummaryRow("Delivery Charges", "Free"),
                      // SpaceWidget(height: 10),
                      // _orderTotalRow(controller.totalWithGst),

                      _buildSummaryRow(
                          "Total Amount", controller.totalWithoutGst),
                      _buildSummaryRow("Gst",
                          controller.totalWithGst - controller.totalWithoutGst),
                      _discountTotalRow(
                        "Discount", controller.discountAmount,
                        // controller.discountPercentage
                      ),
                      // _buildSummaryRow("Total Before Tax", "4166.67"),
                      _buildSummaryRow("Delivery Charges", "Free"),
                      if (controller.orderDetailsData.order != null)
                        _discountTotalRow(
                            "Online Payment Discount",
                            num.parse(controller
                                .orderDetailsData.order!.checkoutDiscount!)),
                      // returnTotalRow(
                      //     controller.orderDetailsData.order!.total! < 0.5
                      //         ? (controller.orderDetailsData.order!.paidAmount /
                      //                 100) -
                      //             num.parse(controller
                      //                 .orderDetailsData.order!.total
                      //                 .toString())
                      //         : (controller.orderDetailsData.order!.paidAmount /
                      //                 100) -
                      //             controller.orderDetailsData.order!.total!,
                      //     // tripController.discountPercentage
                      //    ),

                      returnTotalRow(
                          orderPaidAmount:
                              controller.orderDetailsData.order!.paidAmount /
                                  100,
                          orderNowAmount:
                              controller.orderDetailsData.order!.total!),
                      SpaceWidget(height: 10),
                      if (controller.orderDetailsData.order != null)
                        _orderTotalRow(controller.orderDetailsData.order!.total!
                            // controller.totalWithGst
                            ),

                      SpaceWidget(height: 10),

                      SpaceWidget(height: 20),

                      // Text("Notes", style: Get.textTheme.titleLarge),
                      // const SpaceWidget(height: 5),
                      // Text(
                      //   "Leave at the front door. Ring the doorbell twice.",
                      //   style: Get.textTheme.labelSmall,
                      // ),

                      SpaceWidget(height: 20),

                      Column(
                        children: [
                          Card(
                            color: controller.orderDetailsData.order!.status ==
                                    "out for delivery"
                                ? ORANGE_COLOR
                                : controller.orderDetailsData.order!.status ==
                                        "delivered"
                                    ? GREEN_COLOR
                                    : REDAPPTHEME_COLOR,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusGeometry.circular(30.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 12.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Order Status:",
                                      style: Get.textTheme.headlineMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: WHITE_COLOR)),
                                  Text(
                                      "${controller.orderDetailsData.order!.status}"
                                          .capitalizeFirst!,
                                      style: Get.textTheme.headlineMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: WHITE_COLOR))
                                ],
                              ),
                            ),
                          ),
                          SpaceWidget(height: 10),
                          CustomActionButton(
                            buttonTitle: "Call Customer",
                            onTapFun: () {
                              makePhoneCall(controller
                                      .orderDetailsData.user!.mobileNumber ??
                                  "");
                            },
                            titleColor: APPTHEME_COLOR,
                            backgroundColor: BUTTON_BG_COLOR,
                          ),
                          SpaceWidget(height: 10),

                          // if ((controller.orderDetailsData.order!.status ==
                          //             "cancelled" ||
                          //         controller.orderDetailsData.order!.status ==
                          //             "delivered") &&
                          if (controller
                                  .orderDetailsData.order!.isFeedbackGiven ==
                              0)
                            CustomActionButton(
                              buttonTitle: "Give Feedback",
                              onTapFun: () {
                                getFeedbackFun(context);
                              },
                              titleColor: BUTTON_BG_COLOR,
                              backgroundColor: APPTHEME_COLOR,
                            ),
                          // CustomActionButton(
                          //   buttonTitle: "Give Feedback",
                          //   onTapFun: () {},
                          //   titleColor: BUTTON_BG_COLOR,
                          //   backgroundColor: APPTHEME_COLOR,
                          // ),
                        ],
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }

  Widget _buildInvoiceHeadingRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Expanded(child: Text("Item", style: Get.textTheme.titleMedium)),
          Expanded(
              child: Row(
            children: [
              // SpaceWidget(
              //   width: 15,
              // ),
              Expanded(child: Text("qty", style: Get.textTheme.titleMedium)),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Price", style: Get.textTheme.titleMedium),
                ],
              )),
            ],
          )),
        ],
      ),
    );
  }

  List<String> returnItems = [];

  Widget _buildInvoiceRow(String item, int qty, num price) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.5.h),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print("ontap ..$returnItems");
          setState(() {
            if (!returnItems.contains(item)) {
              returnItems.add(item);
            } else {
              returnItems.remove(item);
            }
          });
        },
        child: Row(
          children: [
            // Container(
            //   width: 15.w,
            //   height: 15.h,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       border: Border.all(
            //           color: returnItems.contains(item)
            //               ? INDICATION_COLOR
            //               : APPTHEME_COLOR,
            //           width: 1.3.w),
            //       color: WHITE_COLOR),
            //   child: returnItems.contains(item)
            //       ? Center(
            //           child: Container(
            //             width: 8.w,
            //             height: 8.h,
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: INDICATION_COLOR,
            //             ),
            //           ),
            //         )
            //       : null,
            // ),
            // SpaceWidget(
            //   width: 15.w,
            // ),
            Expanded(
                // flex: 2,
                child: Text(item,
                    style: TextStyle(
                        color: returnItems.contains(item)
                            ? INDICATION_COLOR
                            : BLACK_TEXT_COLOR,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500))),
            Expanded(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(qty.toString(),
                        style: TextStyle(
                            color: returnItems.contains(item)
                                ? INDICATION_COLOR
                                : BLACK_TEXT_COLOR,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "₹",
                                style: TextStyle(
                                    color: returnItems.contains(item)
                                        ? INDICATION_COLOR
                                        : BLACK_TEXT_COLOR,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                                children: [
                              TextSpan(
                                  text: price.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: returnItems.contains(item)
                                          ? INDICATION_COLOR
                                          : BLACK_TEXT_COLOR,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500))
                            ])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    dynamic amount,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Get.textTheme.titleMedium),
          RichText(
              text: TextSpan(
                  text: label.contains("Delivery") ? "" : "₹",
                  style: TextStyle(color: BLACK_TEXT_COLOR),
                  children: [
                TextSpan(
                    text: label.contains("Delivery")
                        ? amount
                        : amount.toStringAsFixed(2),
                    style: Get.textTheme.titleSmall)
              ])),
        ],
      ),
    );
  }

  Widget _orderTotalRow(
    num amount,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Order Total",
              style: Get.textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          RichText(
              text: TextSpan(
                  text: "₹",
                  style: TextStyle(color: BLACK_TEXT_COLOR, fontSize: 16.sp),
                  children: [
                TextSpan(
                    text: amount.toStringAsFixed(2),
                    style: Get.textTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold))
              ])),
        ],
      ),
    );
  }

  // Widget _discountTotalRow(num amount, num percentage) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 2.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text("Discount (${percentage.toStringAsFixed(2)}%)",
  //             style: Get.textTheme.titleMedium),
  //         RichText(
  //             text: TextSpan(
  //                 text: "- ₹",
  //                 style: TextStyle(color: INDICATION_COLOR, fontSize: 16.sp),
  //                 children: [
  //               TextSpan(
  //                   text: amount.toStringAsFixed(2),
  //                   style: Get.textTheme.titleMedium!
  //                       .copyWith(color: INDICATION_COLOR))
  //             ])),
  //       ],
  //     ),
  //   );
  // }

  Widget _discountTotalRow(
    String text,
    num amount,
    // num percentage
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              // (${percentage.toStringAsFixed(2)}%)",
              style: Get.textTheme.titleMedium),
          RichText(
              text: TextSpan(
                  text: "- ₹",
                  style: TextStyle(color: INDICATION_COLOR, fontSize: 16.sp),
                  children: [
                TextSpan(
                    text: amount.toStringAsFixed(2),
                    style: Get.textTheme.titleMedium!
                        .copyWith(color: INDICATION_COLOR))
              ])),
        ],
      ),
    );
  }

  double _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();
  void _submitFeedback() {
    final feedback = _feedbackController.text;
    print("Rating: $_rating");
    print("Feedback: $feedback");

    // Show success message or send to backend
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Feedback submitted successfully')),
    );

    // Clear fields after submission
    setState(() {
      _rating = 0;
      _feedbackController.clear();
    });
  }

  // getFeedbackFun() {
  //   Get.dialog(Dialog(
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             "Rate the Delivery Experience",
  //             style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
  //           ),
  //           SpaceWidget(height: 16),
  //           RatingBar.builder(
  //             initialRating: _rating,
  //             minRating: 1,
  //             allowHalfRating: true,
  //             itemCount: 5,
  //             itemPadding: EdgeInsets.symmetric(horizontal: 4.0.h),
  //             itemBuilder: (context, _) =>
  //                 Icon(Icons.star, color: Colors.amber),
  //             onRatingUpdate: (rating) {
  //               setState(() {
  //                 _rating = rating;
  //               });
  //             },
  //           ),
  //           SpaceWidget(height: 24),
  //           TextField(
  //             controller: _feedbackController,
  //             maxLines: 5,
  //             decoration: InputDecoration(
  //               labelText: "Write your feedback",
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           SpaceWidget(height: 24),
  //           ElevatedButton.icon(
  //             onPressed: _submitFeedback,
  //             icon: Icon(Icons.send),
  //             label: Text("Submit Feedback"),
  //             style: ElevatedButton.styleFrom(
  //               minimumSize: Size(double.infinity, 50.h),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ));
  // }
  TripController tripController = Get.put(TripController());
  final _formKey2 = GlobalKey<FormState>();

  getFeedbackFun(BuildContext context) {
    tripController.providerId = 0;
    tripController.tripOrderId = "";
    tripController.rating = 1;
    tripController.feedbackController.clear();
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          backgroundColor: WHITE_BG_COLOR,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(3.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25..h),
            child: Obx(() {
              return tripController.returnLoading.value
                  ? SizedBox(
                      height: 200,
                    )
                  : Form(
                      key: _formKey2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CloseWidget(closeFun: () {
                            Get.back();
                          }),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "How was your overall\norder expericence?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: APPTHEME_COLOR,
                                    fontSize: 20.sp,
                                    fontFamily: "SemiBold"),
                              ),
                            ],
                          ),
                          SpaceWidget(height: 15),
                          Center(
                            child: RatingBar.builder(
                              initialRating: tripController.rating,
                              minRating: 1,
                              allowHalfRating: false,
                              itemSize: 27.h,
                              itemCount: 5,
                              unratedColor:
                                  Color(0xff63706F).withCustomOpacity(0.3),
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) =>
                                  Icon(Icons.star, color: ORANGE_COLOR),
                              onRatingUpdate: (rating) {
                                tripController.rating = rating;
                                tripController.update();
                              },
                            ),
                          ),
                          SpaceWidget(height: 21),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Overall Feedback *",
                                  style: TextStyle(
                                      color: Color(0xff63706F),
                                      fontSize: 14.sp,
                                      fontFamily: "Medium"),
                                ),
                              ],
                            ),
                          ),
                          SpaceWidget(height: 13),
                          Multilinetextfield(
                              textEditingController:
                                  tripController.feedbackController,
                              maxlines: 5,
                              keyboardType: TextInputType.multiline,
                              validationFun: (value) {
                                if (value!.isEmpty) {
                                  return "Please write your feedback";
                                } else {
                                  return null;
                                }
                              }),
                          SpaceWidget(height: 10),
                          Obx(() {
                            return tripController.addFeedbackLoading.value
                                ? LoaderWidget()
                                : CustomActionButton(
                                    buttonTitle: "SUBMIT",
                                    onTapFun: () async {
                                      // FocusScope.of(context).unfocus();
                                      if (_formKey2.currentState!.validate()) {
                                        Get.focusScope?.unfocus();
                                        print("feedback fun");
                                        dynamic res = await tripController
                                            .getAddFeedbackController(
                                                tripOrderId: controller
                                                    .orderDetailsData
                                                    .order!
                                                    .tripOrderId,
                                                providerId: controller
                                                    .orderDetailsData
                                                    .order!
                                                    .userId,
                                                from: "previoustrip");

                                        print("fee.... $res");
                                        if (res != null) {
                                          if (res
                                              .toString()
                                              .contains("success")) {
                                            // initFun();
                                            if (mounted) {
                                              setState(() {
                                                controller.orderDetailsData
                                                    .order!.isFeedbackGiven = 1;
                                              });
                                            }
                                          }
                                        }
                                      }
                                    });
                          })
                        ],
                      ),
                    );
            }),
          ),
        ));
  }
}

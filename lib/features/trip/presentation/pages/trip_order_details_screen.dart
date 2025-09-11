import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/loader.dart';
import 'package:dtr_delivery/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/common_outline_button.dart';
import '../../../../utils/custom_action_button.dart';
import '../../../../utils/order_widget.dart';
import '../../../../utils/square_action_button.dart';
import '../manager/trip_controller.dart';
import '../widgets/trips_widgets.dart';

class TripOrderDetailsScreen extends StatefulWidget {
  final String orderId;
  const TripOrderDetailsScreen({
    super.key,
    required this.orderId,
  });

  @override
  State<TripOrderDetailsScreen> createState() => _TripOrderDetailsScreenState();
}

class _TripOrderDetailsScreenState extends State<TripOrderDetailsScreen> {
  final TripController tripController = Get.put(TripController());

  List<String> orderStatus = ["Start Order Packing", "Packing completed"];
  String buttonTitle = "Start Order Packing";
  int index = 0;
  bool otpSubmit = false;
  bool returnSelected = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tripController.orderId = widget.orderId;
      print("order id ...${widget.orderId}");
      tripController.update();
      tripController.getTripOrderDetailsController(widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          title: 'Trip Order Details',
          backNavigation: true,
          actions: [],
          centerTitle: true),
      body: GetBuilder<TripController>(builder: (context) {
        return tripController.orderDetailsLoading.value
            ? LoaderWidget()
            : SingleChildScrollView(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Order ID: ${tripController.selectedTripDetails.orderId}",
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
                                  "Customer: ${tripController.selectedTripDetails.customerName}",
                                  style: Get.textTheme.titleMedium),
                              Text(
                                  tripController.selectedTripDetails.address !=
                                          null
                                      ? "${tripController.selectedTripDetails.address!.address1}, ${tripController.selectedTripDetails.address!.address2}, ${tripController.selectedTripDetails.address!.city}, ${tripController.selectedTripDetails.address!.state}, ${tripController.selectedTripDetails.address!.postalCode}."
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
                            "Contact: +91 ${tripController.selectedTripDetails.customerPhone}",
                            style: Get.textTheme.titleMedium),
                      ],
                    ),
                    SpaceWidget(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order Details", style: Get.textTheme.titleLarge),
                        returnSelected
                            ? SizedBox(
                                width: 120.w,
                                child: RedOutlineButton(
                                  buttonText: "Return",
                                  onTapFun: () {
                                    returnSelected = !returnSelected;
                                    setState(() {});
                                  },
                                ),
                              )
                            : BlackOutlineButton(
                                buttonText: "Select for Return",
                                onTapFun: () {
                                  returnSelected = !returnSelected;
                                  setState(() {});
                                },
                              )
                      ],
                    ),
                    SpaceWidget(height: 10),
                    _buildInvoiceHeadingRow(),
                    SpaceWidget(height: 10),
                    if (tripController.selectedTripDetails.orderDetails != null)
                      for (int i = 0;
                          i <
                              tripController
                                  .selectedTripDetails.orderDetails!.length;
                          i++)
                        _buildInvoiceRow(
                            tripController.selectedTripDetails.orderDetails![i]
                                .productName!,
                            tripController
                                .selectedTripDetails.orderDetails![i].quantity!,
                            tripController.selectedTripDetails.orderDetails![i]
                                .pricePerUnit!),

                    Divider(
                      height: 30.h,
                      color: LIGHT_BLACK_SHADE_COLOR,
                    ),
                    _buildSummaryRow(
                        "Total Amount", tripController.totalWithoutGst),
                    _buildSummaryRow(
                        "Gst",
                        tripController.totalWithGst -
                            tripController.totalWithoutGst),
                    _discountTotalRow(tripController.discountAmount,
                        tripController.discountPercentage),
                    // _buildSummaryRow("Total Before Tax", "4166.67"),
                    _buildSummaryRow("Delivery Charges", "Free"),
                    SpaceWidget(height: 10),
                    _orderTotalRow(tripController.totalWithGst),
                    SpaceWidget(height: 20),

                    // Text("Notes", style: Get.textTheme.titleLarge),
                    // const SpaceWidget(height: 5),
                    // Text(
                    //   "Leave at the front door. Ring the doorbell twice.",
                    //   style: Get.textTheme.labelSmall,
                    // ),

                    SpaceWidget(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: APPTHEME_COLOR,
                          margin: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(3.r)),
                          child: Padding(
                            padding: EdgeInsets.all(12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Status:",
                                    style: Get.textTheme.headlineMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: WHITE_COLOR)),
                                Text(
                                    "${tripController.selectedTripDetails.status}"
                                        .capitalizeFirst!,
                                    style: Get.textTheme.headlineMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: WHITE_COLOR))
                              ],
                            ),
                          ),
                        ),
                        if (tripController.enableOtpWidget.value)
                          OtpCollectionWidget(
                            formKey: tripController.formKey,
                            otpController: tripController.otpController,
                          ),
                        if (tripController.selectedTripDetails.status
                                .toString()
                                .toLowerCase() !=
                            "delivered")
                          Column(
                            children: [
                              SpaceWidget(height: 20),
                              Obx(() {
                                return tripController.buttonLoading.value
                                    ? LoaderWidget()
                                    : SquareActionButton(
                                        buttonTitle: tripController
                                                    .selectedTripDetails
                                                    .reachedTime ==
                                                null
                                            ? "Reached Location"
                                            : (tripController
                                                            .selectedTripDetails
                                                            .otpVerifiedAt ==
                                                        null &&
                                                    tripController
                                                            .enableOtpWidget
                                                            .value ==
                                                        false)
                                                ? "Collect OTP"
                                                : "Complete Delivery",
                                        onTapFun: () async {
                                          if (tripController.selectedTripDetails
                                                  .reachedTime ==
                                              null) {
                                            tripController
                                                .getReachedloactionController(
                                                    tripController
                                                        .selectedTripDetails
                                                        .tripOrderId);
                                          } else if (tripController
                                                      .selectedTripDetails
                                                      .otpVerifiedAt ==
                                                  null &&
                                              tripController
                                                      .enableOtpWidget.value ==
                                                  false) {
                                            await tripController
                                                .getSendOtpController(
                                                    tripController
                                                        .selectedTripDetails
                                                        .tripOrderId);
                                          } else {
                                            if (tripController
                                                .formKey.currentState!
                                                .validate()) {
                                              tripController
                                                  .getCompleteDeliveryController(
                                                      tripOrderId: tripController
                                                          .selectedTripDetails
                                                          .tripOrderId,
                                                      otp: tripController
                                                          .otpController.text);
                                            }
                                          }
                                        },
                                      );
                              }),
                            ],
                          ),
                        SpaceWidget(height: 10),
                        orderStatus[index] == "Delivered"
                            ? CustomActionButton(
                                buttonTitle: "Give Feedback",
                                onTapFun: () {},
                                titleColor: APPTHEME_COLOR,
                                backgroundColor: BUTTON_BG_COLOR,
                              )
                            : CustomActionButton(
                                buttonTitle: "Call Customer",
                                onTapFun: () {
                                  makePhoneCall(tripController
                                          .selectedTripDetails.customerPhone ??
                                      "");
                                },
                                titleColor: APPTHEME_COLOR,
                                backgroundColor: BUTTON_BG_COLOR,
                              ),
                      ],
                    ),
                  ],
                ),
              );
      }),
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
              SpaceWidget(
                width: 15,
              ),
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
            Container(
              width: 15.w,
              height: 15.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: returnItems.contains(item)
                          ? INDICATION_COLOR
                          : APPTHEME_COLOR,
                      width: 1.3.w),
                  color: WHITE_COLOR),
              child: returnItems.contains(item)
                  ? Center(
                      child: Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: INDICATION_COLOR,
                        ),
                      ),
                    )
                  : null,
            ),
            SpaceWidget(
              width: 15.w,
            ),
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

  Widget _discountTotalRow(num amount, num percentage) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Discount (${percentage.toStringAsFixed(2)}%)",
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

  getOtpCollectFun() {
    Get.dialog(Dialog(
        child: OtpCollectionWidget(
      formKey: tripController.formKey,
      otpController: tripController.otpController,
    )));
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

  getFeedbackFun() {
    Get.dialog(Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Rate the Delivery Experience",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SpaceWidget(height: 16),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0.h),
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SpaceWidget(height: 24),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "Write your feedback",
                border: OutlineInputBorder(),
              ),
            ),
            SpaceWidget(height: 24),
            ElevatedButton.icon(
              onPressed: _submitFeedback,
              icon: Icon(Icons.send),
              label: Text("Submit Feedback"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50.h),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

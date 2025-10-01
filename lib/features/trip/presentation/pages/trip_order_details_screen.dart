import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/close_widget.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/loader.dart';
import 'package:dtr_delivery/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_opacity/with_opacity.dart';

import '../../../../utils/common_outline_button.dart';
import '../../../../utils/custom_action_button.dart';
import '../../../../utils/multiLineTextField.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tripController.orderId = widget.orderId;
      print("order id ...${widget.orderId}");
      tripController.otpController.clear();
      tripController.update();
      tripController.getTripOrderDetailsController(widget.orderId, "init");
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
      body: GetBuilder<TripController>(builder: (controller) {
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
                        // returnSelected
                        //     ?
                        if (tripController.enableReturnOrderWidget.value &&
                            tripController.selectedTripDetails.status !=
                                "delivered")
                          SizedBox(
                            width: 120.w,
                            child: RedOutlineButton(
                              buttonText: "Return All",
                              onTapFun: () {
                                getReturnFun(
                                    titleText: "Return All Items",
                                    id: tripController
                                        .selectedTripDetails.orderId);
                              },
                            ),
                          )
                        // : BlackOutlineButton(
                        //     buttonText: "Select for Return",
                        //     onTapFun: () {
                        //       returnSelected = !returnSelected;
                        //       setState(() {});
                        //     },
                        //   )
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
                                .pricePerUnit!,
                            tripController.selectedTripDetails.orderDetails![i]
                                .orderDetailId!,
                            tripController.selectedTripDetails.orderDetails![i]
                                .isCancelled!),

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
                    _discountTotalRow(
                        tripController.discountAmount,
                        // tripController.discountPercentage
                        "Discount"),
                    // _buildSummaryRow("Total Before Tax", "4166.67"),
                    _buildSummaryRow("Delivery Charges", "Free"),
                    if (tripController.selectedTripDetails.checkoutDiscount !=
                        null)
                      _discountTotalRow(
                        num.parse(tripController
                            .selectedTripDetails.checkoutDiscount!),
                        // tripController.discountPercentage
                        "Online Payment Discount",
                      ),
                    returnTotalRow(
                        orderPaidAmount: tripController
                                .selectedTripDetails.orderAmountCollected /
                            100,
                        orderNowAmount:
                            tripController.selectedTripDetails.orderTotal!),

                    SpaceWidget(height: 10),

                    // _orderTotalRow(tripController.totalWithGst),
                    // _orderTotalRow((num.parse(tripController
                    //         .selectedTripDetails.orderAmountCollected
                    //         .toString()) /
                    //     100)),

                    _orderTotalRow(
                        tripController.selectedTripDetails.orderTotal! < 0.5
                            ? 0
                            : num.parse(tripController
                                .selectedTripDetails.orderTotal
                                .toString())),
                    SpaceWidget(height: 20),
                    // _returnTotalRow(
                    //     tripController.discountAmount,
                    //     // tripController.discountPercentage
                    //     "Return Amount"),
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
                          color: tripController.selectedTripDetails.status ==
                                  "out for delivery"
                              ? ORANGE_COLOR
                              : tripController.selectedTripDetails.status ==
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

                        // Form(
                        //   key: tripController.formKey,
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Padding(
                        //         padding: EdgeInsets.symmetric(vertical: 20.h),
                        //         child: Text("Enter OTP",
                        //             style: Get.textTheme.titleLarge),
                        //       ),
                        //       // SpaceWidget(
                        //       //   height: 10,
                        //       // ),
                        //       CustomOtpField(
                        //         onCompleted: (otp) {
                        //           print("otp....")
                        //           tripController.otpController.text = otp;
                        //           tripController.update();
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        if (tripController.selectedTripDetails.status
                                    .toString()
                                    .toLowerCase() !=
                                "delivered" &&
                            tripController.selectedTripDetails.status
                                    .toString()
                                    .toLowerCase() !=
                                "cancelled")
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
                                              Get.focusScope!.unfocus();
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
                        CustomActionButton(
                          buttonTitle: "Call Customer",
                          onTapFun: () {
                            makePhoneCall(tripController
                                    .selectedTripDetails.customerPhone ??
                                "");
                          },
                          titleColor: APPTHEME_COLOR,
                          backgroundColor: BUTTON_BG_COLOR,
                        ),
                        SpaceWidget(height: 10),
                        if ((tripController.selectedTripDetails.status ==
                                    "cancelled" ||
                                tripController.selectedTripDetails.status ==
                                    "delivered") &&
                            tripController
                                    .selectedTripDetails.isFeedbackGiven ==
                                0)
                          CustomActionButton(
                            buttonTitle: "Give Feedback",
                            onTapFun: () {
                              getFeedbackFun(context);
                            },
                            titleColor: BUTTON_BG_COLOR,
                            backgroundColor: APPTHEME_COLOR,
                          ),
                      ],
                    ),
                  ],
                ),
              );
      }),
    );
  }

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
                                    onTapFun: () {
                                      // FocusScope.of(context).unfocus();
                                      if (_formKey2.currentState!.validate()) {
                                        Get.focusScope?.unfocus();
                                        print("feedback fun");
                                        tripController.getAddFeedbackController(
                                            tripOrderId: tripController
                                                .selectedTripDetails
                                                .tripOrderId,
                                            providerId: tripController
                                                .selectedTripDetails.userId,
                                            from: "currenttrips");
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

  Widget _buildInvoiceHeadingRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Expanded(child: Text("Item", style: Get.textTheme.titleMedium)),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text("qty", style: Get.textTheme.titleMedium)),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Price", style: Get.textTheme.titleMedium),
                ],
              )),
            ],
          )),
          SpaceWidget(
            width: 5,
          ),
          if (tripController.selectedTripDetails.status != "delivered" &&
              tripController.selectedTripDetails.status != "cancelled")
            SizedBox(
                height: 25,
                child: ReturnButton(
                    color: Colors.transparent,
                    onTapFun: () {},
                    buttonTitle: tripController.enableReturnOrderWidget.value
                        ? "Return"
                        : "Return Completed"))
        ],
      ),
    );
  }

  List<String> returnItems = [];

  Widget _buildInvoiceRow(
    String item,
    int qty,
    num price,
    String id,
    int returnEnable,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.4.h),
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
            SpaceWidget(
              width: 5,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    // flex: 1,
                    child: Text(qty.toString(),
                        style: TextStyle(
                            color: returnItems.contains(item)
                                ? INDICATION_COLOR
                                : BLACK_TEXT_COLOR,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500)),
                  ),
                  Expanded(
                    // flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
            SpaceWidget(
              width: 5,
            ),
            if (tripController.selectedTripDetails.status != "delivered" &&
                tripController.selectedTripDetails.status != "cancelled")
              (returnEnable == 0)
                  ? SizedBox(
                      height: 21,
                      width: 67.w,
                      child: ReturnButton(
                          onTapFun: () {
                            getReturnFun(titleText: "Return $item", id: id);
                          },
                          buttonTitle: "Return"))
                  : SizedBox(
                      height: 21,
                      child: ReturnDoneButton(
                          color: GREEN_COLOR,
                          onTapFun: () {},
                          buttonTitle: "Returned")),
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
                    text:
                        //  double.parse(tripController
                        //         .selectedTripDetails.orderTotal
                        //         .toString())
                        //     .toStringAsFixed(2),

                        amount.toStringAsFixed(2),
                    style: Get.textTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold))
              ])),
        ],
      ),
    );
  }

  Widget _discountTotalRow(
      num amount,
      //  num percentage
      String text) {
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

  final _formKey = GlobalKey<FormState>();

  getReturnFun({required titleText, required id}) {
    tripController.reasonTextEditingController.clear();
    tripController.isDamagedVal.value = false;
    tripController.returnLoading.value = false;
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          backgroundColor: WHITE_BG_COLOR,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(3.r)),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25..h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          titleText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: APPTHEME_COLOR,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "SemiBold"),
                        ),
                        CloseWidget(closeFun: () {
                          Get.back();
                        })
                      ],
                    ),
                    SpaceWidget(height: 20),
                    Text(
                      "Reason",
                      style: TextStyle(
                          color: APPTHEME_COLOR,
                          fontSize: 14.sp,
                          fontFamily: "Medium"),
                    ),
                    SpaceWidget(height: 13),
                    Multilinetextfield(
                        textEditingController:
                            tripController.reasonTextEditingController,
                        maxlines: 7,
                        keyboardType: TextInputType.multiline,
                        validationFun: (value) {
                          if (value!.isEmpty) {
                            return "Please enter reason";
                          } else {
                            return null;
                          }
                        }),
                    SpaceWidget(height: 13),
                    Obx(() {
                      return tripController.loading.value
                          ? SizedBox.shrink()
                          : Row(
                              children: [
                                Checkbox(
                                  side: BorderSide(
                                    color: LIGHT_LINE_COLOR,
                                    width: 1.5,
                                  ),
                                  value: tripController.isDamagedVal.value,
                                  onChanged: (bool? value) {
                                    print("chek ...$value");
                                    tripController.isDamagedVal.value =
                                        value ?? false;
                                    tripController.update();
                                  },
                                ),
                                // SpaceWidget(
                                //   width: 8,
                                // ),
                                Text(
                                  "Is damaged?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                )
                              ],
                            );
                    }),
                    SpaceWidget(height: 10),
                    Obx(() {
                      return tripController.returnLoading.value
                          ? SizedBox(height: 40, child: LoaderWidget())
                          : CustomActionButton(
                              buttonTitle: "SUBMIT",
                              onTapFun: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (_formKey.currentState!.validate()) {
                                  if (titleText.toString().contains("All")) {
                                    tripController.getReturnOrderController(
                                        returnId: id);
                                  } else {
                                    tripController.getReturnItemController(
                                        returnId: id);
                                  }
                                }
                              });
                    })
                  ],
                ),
              )),
        ));
  }
}

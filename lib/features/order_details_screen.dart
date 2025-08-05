import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/common_outline_button.dart';
import 'package:dtr_delivery/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../utils/custom_action_button.dart';
import '../utils/square_action_button.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<String> orderStatus = [
    "Order Pick Up",
    "Dispatch",
    "Out for Delivery",
    "Delivered"
  ];
  String buttonTitle = "Order Pick Up";
  int index = 0;
  bool otpSubmit = false;
  bool returnSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          title: 'Order Details',
          backNavigation: true,
          actions: [],
          centerTitle: true),
      // appBar: AppBar(
      //   title: const Text('Order Details'),
      //   leading: const BackButton(),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order ID: #123456", style: Get.textTheme.titleLarge),
            const SizedBox(height: 12),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: LIGHT_BLACK_SHADE_COLOR,
                  child: Icon(
                    Icons.person_2_outlined,
                    color: BLACK_COLOR,
                  ),
                  // Replace with actual image asset
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Customer: Sarah Miller",
                          style: Get.textTheme.titleMedium),
                      Text("456 Elm Street, Anytown",
                          style: Get.textTheme.labelSmall),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: LIGHT_BLACK_SHADE_COLOR),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.call_outlined),
                  ),
                ),
                SpaceWidget(
                  width: 10,
                ),
                Text("Contact: +91 8123456789",
                    style: Get.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 10),
            _buildInvoiceHeadingRow(),
            const SizedBox(height: 10),
            _buildInvoiceRow("Ventilator", 150, "5000"),
            _buildInvoiceRow("Dolo Tablets", 100, "2500"),
            _buildInvoiceRow("Tissues", 50, "200"),
            const Divider(
              height: 30,
              color: LIGHT_BLACK_SHADE_COLOR,
            ),
            _buildSummaryRow("Total Amount", "7500"),
            // _buildSummaryRow("Discount (40%)", "3000"),
            _discountTotalRow("3000"),
            _buildSummaryRow("Total Before Tax", "4166.67"),
            _buildSummaryRow("Delivery Charges", "Free"),
            const SizedBox(height: 10),
            _orderTotalRow("4500"),
            const SizedBox(height: 20),

            // Text("Notes", style: Get.textTheme.titleLarge),
            // const SizedBox(height: 5),
            // Text(
            //   "Leave at the front door. Ring the doorbell twice.",
            //   style: Get.textTheme.labelSmall,
            // ),

            const SizedBox(height: 20),
            SquareActionButton(
              buttonTitle: otpSubmit ? "Delivered" : buttonTitle,
              onTapFun: () {
                setState(() {
                  if (orderStatus[index] == "Out for Delivery") {
                    getOtpCollectFun();
                  } else {
                    if (index <= 3) {
                      index = index + 1;
                      buttonTitle = orderStatus[index];
                    }
                  }
                });
                // if (_formKey.currentState!.validate()) {
                // controller.getSignIn();
                // }
                // controller.update();
              },
            ),
            const SizedBox(height: 10),
            orderStatus[index] == "Delivered"
                ? CustomActionButton(
                    buttonTitle: "Give Feedback",
                    onTapFun: () {},
                    titleColor: APPTHEME_COLOR,
                    backgroundColor: BUTTON_BG_COLOR,
                  )
                : CustomActionButton(
                    buttonTitle: "Call Customer",
                    onTapFun: () {},
                    titleColor: APPTHEME_COLOR,
                    backgroundColor: BUTTON_BG_COLOR,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceHeadingRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
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

  Widget _buildInvoiceRow(String item, int qty, String price) {
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
                                  text: price,
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
    String amount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Get.textTheme.titleMedium),
          RichText(
              text: TextSpan(
                  text: label.contains("Delivery") ? "" : "₹",
                  style: TextStyle(color: BLACK_TEXT_COLOR),
                  children: [
                TextSpan(text: amount, style: Get.textTheme.titleSmall)
              ])),
        ],
      ),
    );
  }

  Widget _orderTotalRow(
    String amount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Order Total", style: Get.textTheme.headlineMedium),
          RichText(
              text: TextSpan(
                  text: "₹",
                  style: TextStyle(color: BLACK_TEXT_COLOR, fontSize: 16),
                  children: [
                TextSpan(text: amount, style: Get.textTheme.headlineMedium)
              ])),
        ],
      ),
    );
  }

  Widget _discountTotalRow(
    String amount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Discount (40%)", style: Get.textTheme.titleMedium),
          RichText(
              text: TextSpan(
                  text: "- ₹",
                  style: TextStyle(color: INDICATION_COLOR, fontSize: 16),
                  children: [
                TextSpan(
                    text: amount,
                    style: Get.textTheme.titleMedium!
                        .copyWith(color: INDICATION_COLOR))
              ])),
        ],
      ),
    );
  }

  final FocusNode focusNode = FocusNode();
  TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  getOtpCollectFun() {
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 60,
        textStyle: const TextStyle(
            fontSize: 20, color: APPTHEME_COLOR, fontFamily: "Medium"),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: MEDIUM_BLACKTEXT_COLOR,
              width: 1.0,
            )
            // Border(
            //   bottom: BorderSide(
            //     color: MEDIUM_BLACKTEXT_COLOR, // Change to desired color
            //     width: 1.0, // Change to desired thickness
            //   ),
            // ),
            ));
    Get.dialog(Dialog(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text("Enter OTP", style: Get.textTheme.titleLarge),
            ),
            Pinput(
              length: 4,
              // You can pass your own SmsRetriever implementation based on any package
              // in this example we are using the SmartAuth
              // smsRetriever: smsRetriever,
              controller: otpController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                // return value == '2222' ? null : 'Pin is incorrect';
                if (value!.isEmpty) {
                  return "Please Enter OTP";
                } else {
                  return null;
                }
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
                // _timer!.cancel();
                // controller.getOtpVerifyController();
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              // cursor: Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       margin: const EdgeInsets.only(bottom: 9),
              //       width: 1,
              //       height: 20,
              //       color: APPTHEME_COLOR,
              //     ),
              //   ],
              // ),
              focusedPinTheme: defaultPinTheme,
              // .
              // copyWith(
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(
              //         color: APPTHEME_COLOR, // Change to desired color
              //         width: 1.0, // Change to desired thickness
              //       ),
              //     ),
              //   ),
              // ),

              // submittedPinTheme: defaultPinTheme.copyWith(
              //   decoration: defaultPinTheme.decoration!.copyWith(
              //     color: fillColor,
              //     borderRadius: BorderRadius.circular(19),
              //     border: Border.all(color: focusedBorderColor),
              //   ),
              // ),
              errorTextStyle: TextStyle(
                  fontFamily: "Medium", fontSize: 12, color: INDICATION_COLOR),
              errorPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: INDICATION_COLOR,
                      width: 1.0,
                    )
                    // border: Border(

                    //   bottom: BorderSide(
                    //     color: INDICATION_COLOR, // Change to desired color
                    //     width: 1.0, // Change to desired thickness
                    //   ),
                    // ),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SquareActionButton(
                  buttonTitle: "Submit",
                  onTapFun: () {
                    if (_formKey.currentState!.validate()) {
                      Get.back();
                      setState(() {
                        otpSubmit = true;
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
    ));
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Rate the Delivery Experience",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 24),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "Write your feedback",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _submitFeedback,
              icon: Icon(Icons.send),
              label: Text("Submit Feedback"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

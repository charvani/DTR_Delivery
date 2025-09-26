import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/common_colors.dart';
import '../../../../utils/space_widget.dart';

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

final defaultPinTheme = PinTheme(
    width: 40.w,
    height: 40.h,
    textStyle:
        TextStyle(fontSize: 20.sp, color: APPTHEME_COLOR, fontFamily: "Medium"),
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: MEDIUM_BLACKTEXT_COLOR,
          width: 1.0.w,
        )
        // Border(
        //   bottom: BorderSide(
        //     color: MEDIUM_BLACKTEXT_COLOR, // Change to desired color
        //     width: 1.0, // Change to desired thickness
        //   ),
        // ),
        ));

class OtpCollectionWidget extends StatelessWidget {
  final Key formKey;
  final TextEditingController otpController;
  const OtpCollectionWidget(
      {super.key, required this.formKey, required this.otpController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text("Enter OTP", style: Get.textTheme.titleLarge),
          ),
          Pinput(
            length: 6,
            // You can pass your own SmsRetriever implementation based on any package
            // in this example we are using the SmartAuth
            // smsRetriever: smsRetriever,
            controller: otpController,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => SpaceWidget(width: 8.w),
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
              // orderDetailsController.getOtpVerifyController();
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
                fontFamily: "Medium", fontSize: 12.sp, color: INDICATION_COLOR),
            errorPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(
                    color: INDICATION_COLOR,
                    width: 1.0.w,
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
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
          //   child: SquareActionButton(
          //       buttonTitle: "Submit",
          //       onTapFun: () {
          //         if (_formKey.currentState!.validate()) {
          //           if (tripController.selectedTripDetails.otp ==
          //               otpController.text) {
          //             setState(() {
          //               otpSubmit = true;
          //             });
          //             Get.back();
          //             tripController
          //                 .getTripOrderDetailsController(widget.orderId);
          //           } else {
          //             SnackBarUtil.errorSnackBar("Please Enter Valid OTP");
          //           }
          //         }
          //       }),
          // ),
          SpaceWidget(
            height: 10,
          )
        ],
      ),
    );
  }
}

class ReturnButton extends StatelessWidget {
  final void Function()? onTapFun;
  final String buttonTitle;
  final Color? color;

  const ReturnButton(
      {super.key,
      required this.onTapFun,
      required this.buttonTitle,
      this.color});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTapFun,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color ?? INDICATION_COLOR),
        padding: WidgetStatePropertyAll(EdgeInsets.all(4.w)),
        minimumSize: WidgetStatePropertyAll(Size(55.w, 10.h)),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(color: WHITE_COLOR, fontSize: 13.sp),
      ),
    );
  }
}



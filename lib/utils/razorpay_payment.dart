// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:medblooms_pharmacy/config/app/app_config.dart';
// import 'package:medblooms_pharmacy/utils/snack_bar.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// import '../config/injector.dart';

// class RazorpayService {
//   var getStore = getIt.get<GetStorage>();
//   late Razorpay _razorpay;
//   final Function(String)? onPaymentSuccess;
//   // final Function(String)? onPaymentFailure;
//   final Function()? onExternalWallet;

//   RazorpayService({
//     required this.onPaymentSuccess,
//     // required this.onPaymentFailure,
//     this.onExternalWallet,
//   }) {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   void openCheckout({required double amount, required String razorpayOrderId}) {
//     var options = {
//       "key": getIt.get<AppConfig>().razorPayKey,
//       'order_id': razorpayOrderId,
//       "amount": (amount * 100).toInt(),
//       'retry': {
//         'enabled': true,
//         'max_count': 1,
//       }, // Convert to paise
//       "currency": "INR",
//       'send_sms_hash': true,
//       "order"
//           "name": "${getStore.read("firstName")}",
//       "description": "Payment for Order",
//       "prefill": {
//         "contact": "${getStore.read("mobileNumber")}",
//         "email": "${getStore.read("email")}",
//       },
//       "hidden": {
//         "contact": false,
//         "email": false,
//       },
//       "readonly": {
//         "contact": true,
//         "email": true,
//       },
//       "theme": {"color": "#004642"} // Optional: Set theme color
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint("Error: $e");
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     if (onPaymentSuccess != null) {
//       onPaymentSuccess!(response.paymentId ?? "Success");
//     }
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     if (response.message != null) {
//       SnackBarUtil.errorSnackBar("Payment failed, please try again.");
//     }
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     if (response.walletName != null) {
//       SnackBarUtil.successSnackBar(
//           "External Wallet Selected - ${response.walletName}");
//     }
//   }

//   void dispose() {
//     _razorpay.clear();
//   }
// }

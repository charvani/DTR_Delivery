import 'package:dtr_delivery/features/trip/data/models/complete_delivery_request_model.dart';
import 'package:dtr_delivery/features/trip/data/models/current_trip_response_model.dart';
import 'package:dtr_delivery/features/trip/data/models/reached_location_request_model.dart';
import 'package:dtr_delivery/features/trip/data/models/report_vehicle_breakdown_model.dart';
import 'package:dtr_delivery/features/trip/data/models/return_order_request_model.dart';
import 'package:dtr_delivery/features/unclaimed_orders/data/models/unclaimed_orders_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../../../../utils/snack_bar.dart';
import '../../../order_details/presentation/manager/order_details_controller.dart';
import '../../data/models/addfeedback_request_model.dart';
import '../../data/models/previous_trips_response_model.dart';
import '../../domain/use_cases/trip_use_cases.dart';

class TripController extends GetxController {
  RxBool loading = false.obs;
  RxBool orderDetailsLoading = false.obs;
  RxBool buttonLoading = false.obs;
  RxBool returnLoading = false.obs;
  RxBool breakdownLoading = false.obs;
  RxBool addFeedbackLoading = false.obs;

  RxBool isDamagedVal = false.obs;
  var getStore = getIt.get<GetStorage>();
  var tripsUseCase = getIt.get<TripUseCase>();
  bool previousTrips = false;
  final ScrollController previousTripsListScrollController = ScrollController();
  RxBool paginationLoading = false.obs;
  RxInt paginationPage = 0.obs;
  List<Trips> previousTripsList = [];
  List<CurrentTripResponseModel> currentTripList = [];
  num currentTripOrderTotal = 0;
  num previousTripOrderTotal = 0;
  List<CurrentTripResponseModel> previousTripOrdersList = [];
  CurrentTripResponseModel selectedTripDetails = CurrentTripResponseModel();
  RxString punch = "".obs;
  // final OrderDetailsController orderDetailsController =
  //     Get.put(OrderDetailsController());
  final orderDetailsController = Get.put(OrderDetailsController());

  String orderId = '';
  num totalWithoutGst = 0;
  num totalWithGst = 0;
  num totalCgst = 0;
  num totalIgst = 0;
  num totalSgst = 0;
  num discountAmount = 0;
  num discountPercentage = 0;
  TextEditingController otpController = TextEditingController();
  TextEditingController reasonTextEditingController = TextEditingController();
  TextEditingController breakDwonReasonTextEditingController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool enableOtpWidget = false.obs;
  RxBool enableReturnOrderWidget = false.obs;
  double rating = 1;
  dynamic providerId = 1;
  dynamic tripOrderId = "1";
  final TextEditingController feedbackController = TextEditingController();
  getPreviousTripsController() async {
    print("heree paginationPage...${paginationPage.value}");

    try {
      if (paginationPage.value > 0) {
        paginationLoading.value = true;
      } else {
        loading.value = true;
        paginationPage.value = 0;
        previousTripsList.clear();
      }
      update();

      print("i am ata...");
      final unclaimedOrdersRequestModel = UnclaimedOrdersRequestModel(
        page: paginationPage.value,
        limit: 10,
      );
      await tripsUseCase
          .getPreviousTripUseCase(unclaimedOrdersRequestModel)
          .then((value) async {
        print("contro....$value");

        print("value totla///${value.total}");
        print("previousTripsList totla///${previousTripsList.length}");
        if (value.trips != null) {
          if (value.trips!.isNotEmpty) {
            for (var item in value.trips!) {
              previousTripsList.add(item);
            }
          }
        }
        Future.delayed(Duration(seconds: 1), () {
          loading.value = false;
          paginationLoading.value = false;
          update();
        });
      });
    } catch (e) {
      loading.value = false;
    }
  }

  getCurrentTripController() async {
    try {
      loading.value = true;
      enableOtpWidget.value = false;
      currentTripOrderTotal = 0;
      currentTripList.clear();
      update();
      await tripsUseCase.getCurrentTripUseCase().then((value) async {
        print("contro....$value");

        if (value.isNotEmpty) {
          for (var item in value) {
            currentTripList.add(item);
            currentTripOrderTotal =
                currentTripOrderTotal + num.parse(item.orderTotal.toString());
            print("order t... $currentTripOrderTotal");
          }
        }
        loading.value = false;
        update();
      });
    } catch (e) {
      loading.value = false;
    }
  }

  getReachedloactionController(tripOrderId) async {
    try {
      buttonLoading.value = true;
      final reachedLocationRequestModel =
          ReachedLocationRequestModel(tripOrderId: tripOrderId);
      update();
      await tripsUseCase
          .getReachedLocationUseCase(reachedLocationRequestModel)
          .then((value) async {
        print("contro....$value");
        await getTripOrderDetailsController(orderId, "init");
        buttonLoading.value = false;
        update();
      });
    } catch (e) {
      print("get cont e.. $e");
      buttonLoading.value = false;
    }
  }

  getTripOrderDetailsController(orderId, from) async {
    try {
      totalWithoutGst = 0.0;
      totalWithGst = 0;
      totalCgst = 0.0;
      totalIgst = 0.0;
      totalSgst = 0.0;
      discountAmount = 0;
      discountPercentage = 0;
      if (from == "init") {
        orderDetailsLoading.value = true;
      }
      enableReturnOrderWidget.value = false;
      update();
      print("order iddd..$orderId");
      num subTotalVal = 0.0;
      num salePrice = 0;

      await getCurrentTripController();
      if (selectedTripDetails.orderDetails != null) {
        if (selectedTripDetails.orderDetails!.isNotEmpty) {
          selectedTripDetails.orderDetails!.clear();
          selectedTripDetails.orderDetails = [];
        }
      }
      for (int i = 0; i < currentTripList.length; i++) {
        if (currentTripList[i].orderId == orderId) {
          selectedTripDetails = currentTripList[i];

          for (int i = 0; i < selectedTripDetails.orderDetails!.length; i++) {
            if (selectedTripDetails.orderDetails![i].isCancelled == 0) {
              enableReturnOrderWidget.value = true;
            }

            salePrice = selectedTripDetails.orderDetails![i].pricePerUnit!;
            print("at for loopppppp...............out $salePrice");

//this below total for to calculate gst
            /*   toalVal.value = toalVal.value +
              (Data[i].item_sale_rate * Data[i].quantity); */ //this without pricebased on quantity

            subTotalVal =
                (salePrice * selectedTripDetails.orderDetails![i].quantity!);
            print("<< subTotalVal..$subTotalVal");

            //cgst
            totalCgst = subTotalVal *
                (num.parse(
                        selectedTripDetails.orderDetails![i].cgst.toString()) /
                    100);
            print("<<total cgst...$totalCgst");

            //igst
            totalIgst = subTotalVal *
                ((num.parse(
                        selectedTripDetails.orderDetails![i].igst.toString())) /
                    100);
            print("<<total igst...$totalIgst");

            //sgst
            totalSgst = subTotalVal *
                ((num.parse(
                        selectedTripDetails.orderDetails![i].sgst.toString())) /
                    100);
            print("<<total sgst...$totalSgst");

            subTotalVal = subTotalVal + totalCgst + totalIgst + totalSgst;
            print("<< tot..$subTotalVal");

            //for  total without gst
            totalWithoutGst = totalWithoutGst +
                (salePrice * selectedTripDetails.orderDetails![i].quantity!);
            print("<< totalWithoutGst..$totalWithoutGst");

            //for  total with gst
            totalWithGst = totalWithGst + subTotalVal;
            print("<< totalWithGst..$totalWithGst");

//for discount amount
            discountAmount = discountAmount +
                (selectedTripDetails.orderDetails![i].originalPrice! -
                    selectedTripDetails.orderDetails![i].pricePerUnit!);
            print("<< discountAmount..$discountAmount");

//for discount percentage
            discountPercentage = discountPercentage +
                ((discountAmount /
                        selectedTripDetails.orderDetails![i].originalPrice!) *
                    100);
            print("<< discountAmount..$discountPercentage");
          }
        }
      }

      orderDetailsLoading.value = false;
      update();
    } catch (e) {
      print("get cont e.. $e");
      orderDetailsLoading.value = false;
    }
  }

  getSendOtpController(tripOrderId) async {
    try {
      buttonLoading.value = true;
      final reachedLocationRequestModel =
          ReachedLocationRequestModel(tripOrderId: tripOrderId);
      update();
      await tripsUseCase
          .getSendOtpUseCase(reachedLocationRequestModel)
          .then((value) async {
        print("contro....$value");
        enableOtpWidget.value = true;
        // await getTripOrderDetailsController(orderId);
        buttonLoading.value = false;
        update();
      });
    } catch (e) {
      print("get cont e.. $e");
      buttonLoading.value = false;
    }
  }

  getCompleteDeliveryController({required tripOrderId, required otp}) async {
    print("at complete");
    try {
      buttonLoading.value = true;
      final completeDeliveryRequestModel =
          CompleteDeliveryRequestModel(tripOrderId: tripOrderId, otp: otp);
      update();
      await tripsUseCase
          .getCompleteDeliveryUseCase(completeDeliveryRequestModel)
          .then((value) async {
        print("contro..complete..$value");
        if (value != null) {
          if (value.toString().toLowerCase() != "invalid otp") {
            enableOtpWidget.value = false;
            await getTripOrderDetailsController(orderId, "init");
            getCurrentTripController();
          } else {
            enableOtpWidget.value = true;
          }
        }
        buttonLoading.value = false;
        update();
      });
    } catch (e) {
      print("get cont e.. $e");
      buttonLoading.value = false;
    }
  }

  getPreviousTripDetailsController({required tripId}) async {
    try {
      loading.value = true;
      previousTripOrdersList.clear();
      previousTripOrderTotal = 0;

      final reachedLocationRequestModel =
          ReachedLocationRequestModel(tripOrderId: tripId);
      update();
      await tripsUseCase
          .getPreviousTripDetailsUseCase(reachedLocationRequestModel)
          .then((value) async {
        print("contro....$value");

        if (value.isNotEmpty) {
          for (var item in value) {
            previousTripOrdersList.add(item);
            previousTripOrderTotal =
                previousTripOrderTotal + num.parse(item.orderTotal.toString());
            print("order t... $previousTripOrderTotal");
          }
        }
        loading.value = false;
        update();
      });
    } catch (e) {
      loading.value = false;
    }
  }

  getReturnOrderController({required returnId}) async {
    try {
      returnLoading.value = true;
      final returnOrderRequestModel = ReturnOrderRequestModel(
          isDamaged: isDamagedVal.value,
          orderId: returnId,
          reason: reasonTextEditingController.text);
      update();
      await tripsUseCase
          .getReturnOrderUseCase(returnOrderRequestModel)
          .then((value) async {
        print("contro....$value");

        if (value.toString().toLowerCase().contains("success")) {
          Get.back();

          SnackBarUtil.successSnackBar("Order return successfully");
          getTripOrderDetailsController(orderId, "init");
        } else {
          SnackBarUtil.errorSnackBar(value);
        }
        returnLoading.value = false;
        update();
      });
    } catch (e) {
      loading.value = false;
    }
  }

  getReturnItemController({required returnId}) async {
    try {
      returnLoading.value = true;
      final returnOrderRequestModel = ReturnOrderRequestModel(
          isDamaged: isDamagedVal.value,
          orderId: returnId,
          reason: reasonTextEditingController.text);
      update();
      await tripsUseCase
          .getReturnItemUseCase(returnOrderRequestModel)
          .then((value) async {
        print("contro....$value");

        if (value.toString().toLowerCase().contains("success")) {
          Get.back();

          SnackBarUtil.successSnackBar("Order return successfully");

          getTripOrderDetailsController(orderId, "init");
        } else {
          SnackBarUtil.errorSnackBar(value);
        }
        returnLoading.value = false;
        update();
      });
    } catch (e) {
      loading.value = false;
    }
  }

  Future<dynamic> getAddFeedbackController(
      {required providerId, required tripOrderId, required from}) async {
    try {
      addFeedbackLoading.value = true;
      update();
      print("ad fed ...at ${addFeedbackLoading.value}");
      print("ad val1 ...$providerId");
      print("ad val2 ...$tripOrderId");
      print("ad val3 ...$rating");
      print("ad val4 ...${feedbackController.text}");

      final AddFeedbackRequestModel addFeedbackRequestModel =
          AddFeedbackRequestModel(
              providerId: providerId,
              tripOrderId: tripOrderId.toString(),
              rating: rating.toInt(),
              feedback: feedbackController.text.trim());
      print("ad fed ...$addFeedbackRequestModel");
      dynamic value =
          await tripsUseCase.getAddFeedbackUseCase(addFeedbackRequestModel);
      // .then((value) async {
      print("contro....$value");
      if (value != null) {
        if (value.toString().contains("success")) {
          Get.back();
          SnackBarUtil.successSnackBar("Successfully submited your feedback.");
        }
      } else {
        SnackBarUtil.errorSnackBar("Please try again..");
      }
      if (from == "currenttrips") {
        getTripOrderDetailsController(orderId, "feedback");
      }
      addFeedbackLoading.value = false;
      return value;
      // });
    } catch (e) {
      addFeedbackLoading.value = false;
      update();
    }
  }

  Future<dynamic> getReportVehicleBreakdownController({required tripId}) async {
    try {
      breakdownLoading.value = true;
      update();
      print("ad fed ...at ${breakdownLoading.value}");

      print("ad val4 ...${feedbackController.text}");

      final reportVehicleBreakdownRequestModel =
          ReportVehicleBreakdownRequestModel(
              tripId: tripId,
              cancelledReason:
                  breakDwonReasonTextEditingController.text.trim());
      print("ad fed ...$reportVehicleBreakdownRequestModel");
      dynamic value = await tripsUseCase
          .getReportVehicleBreakdownUseCase(reportVehicleBreakdownRequestModel);
      // .then((value) async {
      print("contro....$value");
      if (value != null) {
        if (value == "Raised Vehicle Breakdown request"
            // value.toString().contains("success")
            ) {
          Get.back();
          SnackBarUtil.successSnackBar(
              "Successfully reported your vehicle breakdown.");

          currentTripList[0].cancelledReason = "cancelled";
          loading.value = true;
          update();
          // getCurrentTripController();
        }
      } else {
        SnackBarUtil.errorSnackBar("Please try again..");
      }

      breakdownLoading.value = false;
      loading.value = false;
      return value;
      // });
    } catch (e) {
      breakdownLoading.value = false;
      update();
    }
  }

  Future<dynamic> getWithdrawVehicleBreakdownController(
      {required tripId}) async {
    try {
      breakdownLoading.value = true;
      update();
      print("ad fed ...at ${breakdownLoading.value}");

      final reportVehicleBreakdownRequestModel =
          ReportVehicleBreakdownRequestModel(
        tripId: tripId,
      );
      print("ad fed ...$reportVehicleBreakdownRequestModel");
      dynamic value = await tripsUseCase.getWithdrawVehicleBreakdownUseCase(
          reportVehicleBreakdownRequestModel);
      // .then((value) async {
      print("contro....$value");
      if (value != null) {
        if (value == "Cancelled Vehicle Breakdown request") {
          Get.back();
          SnackBarUtil.successSnackBar(value);
          currentTripList[0].cancelledReason = null;
          loading.value = true;

          update();

          // getCurrentTripController();
        }
      } else {
        SnackBarUtil.errorSnackBar("Please try again..");
      }

      breakdownLoading.value = false;
      loading.value = false;

      return value;
      // });
    } catch (e) {
      breakdownLoading.value = false;
      update();
    }
  }
}

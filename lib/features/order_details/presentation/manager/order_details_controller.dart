import 'package:dtr_delivery/features/assigned_orders/data/models/assigned_orders_response_model.dart';
import 'package:dtr_delivery/features/order_details/data/models/pack_order_request_model.dart';
import 'package:dtr_delivery/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../../../assigned_orders/presentation/manager/assigned_orders_controller.dart';
import '../../../bottom_bar/presentation/pages/bottombar_screen.dart';
import '../../data/models/order_details_request_model.dart';
import '../../data/models/order_details_response_model.dart';
import '../../domain/use_cases/order_details_use_cases.dart';

class OrderDetailsController extends GetxController {
  RxBool attendanceLoading = false.obs;
  RxBool loading = false.obs;
  RxBool claimLoading = false.obs;
  RxBool packingLoading = false.obs;
  var getStore = getIt.get<GetStorage>();
  var orderDetailsUseCase = getIt.get<OrderDetailsUseCase>();
  ValueNotifier<bool>? attandance = ValueNotifier<bool>(false);

  RxList<AssignedOrdersResponseModel> assignedOrders =
      <AssignedOrdersResponseModel>[].obs;
  num totalWithoutGst = 0;
  num totalWithGst = 0;
  num totalCgst = 0;
  num totalIgst = 0;
  num totalSgst = 0;
  num discountAmount = 0;
  num discountPercentage = 0;
  String orderId = "";
  OrderDetailsResponseModel orderDetailsData = OrderDetailsResponseModel();

  getOrderDetailsController(String from) async {
    // /*
    try {
      if (from != "packing") {
        loading.value = true;
      }
      totalWithoutGst = 0.0;
      totalWithGst = 0;
      totalCgst = 0.0;
      totalIgst = 0.0;
      totalSgst = 0.0;
      discountAmount = 0;
      discountPercentage = 0;
      final orderDetailsRequestModel =
          OrderDetailsRequestModel(orderId: orderId);
      update();
      print("i am ata...");
      await orderDetailsUseCase
          .getOrderDetailsUseCase(orderDetailsRequestModel)
          .then((value) async {
        orderDetailsData = value;
        print("contro....$value");
        num subTotalVal = 0.0;
        num salePrice = 0;
        for (int i = 0; i < orderDetailsData.orderDetails!.length; i++) {
          salePrice = 0.0;
          totalCgst = 0.0;
          totalIgst = 0.0;
          totalSgst = 0.0;
          subTotalVal = 0.0;

          salePrice = orderDetailsData.orderDetails![i].price!;
          print("at for loopppppp...............out $salePrice");

//this below total for to calculate gst
          /*   toalVal.value = toalVal.value +
              (Data[i].item_sale_rate * Data[i].quantity); */ //this without pricebased on quantity

          subTotalVal =
              (salePrice * orderDetailsData.orderDetails![i].quantity!);
          print("<< subTotalVal..$subTotalVal");

          //cgst
          totalCgst = subTotalVal *
              (num.parse(orderDetailsData.orderDetails![i].cgst.toString()) /
                  100);
          print("<<total cgst...$totalCgst");

          //igst
          totalIgst = subTotalVal *
              ((num.parse(orderDetailsData.orderDetails![i].igst.toString())) /
                  100);
          print("<<total igst...$totalIgst");

          //sgst
          totalSgst = subTotalVal *
              ((num.parse(orderDetailsData.orderDetails![i].sgst.toString())) /
                  100);
          print("<<total sgst...$totalSgst");

          subTotalVal = subTotalVal + totalCgst + totalIgst + totalSgst;
          print("<< tot..$subTotalVal");

          //for  total without gst
          totalWithoutGst = totalWithoutGst +
              (salePrice * orderDetailsData.orderDetails![i].quantity!);
          print("<< totalWithoutGst..$totalWithoutGst");

          //for  total with gst
          totalWithGst = totalWithGst + subTotalVal;
          print("<< totalWithGst..$totalWithGst");

//for discount amount
          discountAmount = discountAmount +
              ((orderDetailsData.orderDetails![i].itemMrp! -
                      orderDetailsData.orderDetails![i].price!) *
                  orderDetailsData.orderDetails![i].quantity!);
          print("<< discountAmount..$discountAmount");

//for discount percentage
          discountPercentage = discountPercentage +
              ((discountAmount / orderDetailsData.orderDetails![i].itemMrp!) *
                  100);
          print("<< discountAmount..$discountPercentage");

          // //for  total with gst
          // controllOrderTotal.value =
          //     controllOrderTotal.value + subTotalVal.value;
          // print("<< order tot..${controllOrderTotal.value}");
        }
        loading.value = false;
        update();
      });
    } catch (e) {
      print("get. er..$e");
      loading.value = false;
    }
    // */
  }

  getClaimOrderController() async {
    try {
      claimLoading.value = true;
      update();
      final orderDetailsRequestModel =
          OrderDetailsRequestModel(orderId: orderId);
      update();
      print("i am ata...");
      await orderDetailsUseCase
          .getClaimOrderUseCase(orderDetailsRequestModel)
          .then((value) async {
        print("contro....$value");
        if (value['message'] == "Unclaimed Order Assigned") {
          SnackBarUtil.successSnackBar(value['message']);

          Get.offAll(() => BottomBarWidgetPage());
        } else {
          SnackBarUtil.errorSnackBar(value['message']);
        }
      });
      claimLoading.value = false;
      update();
    } catch (e) {
      print("get. er..$e");
      claimLoading.value = false;
    }
  }

  final AssignedOrdersController assignOrderController =
      Get.put(AssignedOrdersController());
  getPackOrderController(bool inspectionVal) async {
    try {
      packingLoading.value = true;
      update();
      final packOrderRequestModel = PackOrderRequestModel(
          orderId: orderId, isInspectionStart: inspectionVal);
      update();
      print("i am ata...");
      await orderDetailsUseCase
          .getPackingUseCase(packOrderRequestModel)
          .then((value) async {
        print("contro....$value");
        getOrderDetailsController("packing");
        // SnackBarUtil.successSnackBar(value['message']);
        assignOrderController.getAssignedOrdersController();
      });

      packingLoading.value = false;
      update();
    } catch (e) {
      print("get. er..$e");
      packingLoading.value = false;
    }
  }
}

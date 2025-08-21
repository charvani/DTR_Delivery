import 'package:dtr_delivery/features/assigned_orders/data/models/assigned_orders_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../../../../utils/snack_bar.dart';
import '../../domain/use_cases/order_details_use_cases.dart';

class OrderDetailsController extends GetxController {
  RxBool attendanceLoading = false.obs;
  RxBool ordersLoading = false.obs;
  var getStore = getIt.get<GetStorage>();
  var orderDetailsUseCase = getIt.get<OrderDetailsUseCase>();
  ValueNotifier<bool>? attandance = ValueNotifier<bool>(false);
  Rx<bool> attandanceVal = false.obs;
  Rx<bool> showAttandanceWidget = false.obs;
  Rx<bool> noFunctionClicked = false.obs;
  RxList<AssignedOrdersResponseModel> assignedOrders =
      <AssignedOrdersResponseModel>[].obs;



}

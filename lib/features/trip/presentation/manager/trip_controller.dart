import 'package:dtr_delivery/features/unclaimed_orders/data/models/unclaimed_orders_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../../data/models/unclaimed_orders_response_model.dart';
import '../../domain/use_cases/trip_use_cases.dart';

class TripController extends GetxController {
  RxBool loading = false.obs;
  var getStore = getIt.get<GetStorage>();
  var unclaimedOrdersUseCase = getIt.get<TripUseCase>();
  ValueNotifier<bool>? attandance = ValueNotifier<bool>(false);
  Rx<bool> attandanceVal = false.obs;
  Rx<bool> showAttandanceWidget = false.obs;
  Rx<bool> noFunctionClicked = false.obs;
  final ScrollController unclaimedOrdersListScrollController =
      ScrollController();
  RxBool paginationLoading = false.obs;
  RxInt paginationPage = 0.obs;
  List<Orders> unclaimedOrdersList = [];
  String punch = "";
  // getTripController() async {
  //   print("heree paginationPage...${paginationPage.value}");

  //   try {
  //     if (paginationPage.value > 0) {
  //       paginationLoading.value = true;
  //     } else {
  //       loading.value = true;
  //       paginationPage.value = 0;
  //       unclaimedOrdersList.clear();
  //     }
  //     update();

  //     print("i am ata...");
  //     final unclaimedOrdersRequestModel = UnclaimedOrdersRequestModel(
  //       query: "",
  //       page: paginationPage.value,
  //       limit: 10,
  //     );
  //     await unclaimedOrdersUseCase
  //         .getUnclaimedOrdersUseCase(unclaimedOrdersRequestModel)
  //         .then((value) async {
  //       print("contro....$value");

  //       print("value totla///${value.total}");
  //       print("unclaimedOrdersList totla///${unclaimedOrdersList.length}");
  //       if (value.orders != null) {
  //         if (value.orders!.isNotEmpty) {
  //           for (var item in value.orders!) {
  //             unclaimedOrdersList.add(item);
  //           }
  //         }
  //       }
  //       loading.value = false;
  //       paginationLoading.value = false;
  //       update();
  //     });
  //   } catch (e) {
  //     loading.value = false;
  //   }
  // }
}

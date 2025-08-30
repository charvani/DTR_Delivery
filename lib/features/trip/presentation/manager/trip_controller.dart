import 'package:dtr_delivery/features/unclaimed_orders/data/models/unclaimed_orders_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../../data/models/previous_trips_response_model.dart';
import '../../domain/use_cases/trip_use_cases.dart';

class TripController extends GetxController {
  RxBool loading = false.obs;
  var getStore = getIt.get<GetStorage>();
  var unclaimedOrdersUseCase = getIt.get<TripUseCase>();

  final ScrollController previousTripsListScrollController =
      ScrollController();
  RxBool paginationLoading = false.obs;
  RxInt paginationPage = 0.obs;
  List<Trips> previousTripsList = [];
  RxString punch = "".obs;
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
      await unclaimedOrdersUseCase
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
        loading.value = false;
        paginationLoading.value = false;
        update();
      });
    } catch (e) {
      loading.value = false;
    }
  }
}

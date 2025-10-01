import 'package:dtr_delivery/features/assigned_orders/data/models/assigned_orders_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../../../../utils/snack_bar.dart';
import '../../domain/use_cases/assigned_orders_use_cases.dart';

class AssignedOrdersController extends GetxController {
  RxBool attendanceLoading = false.obs;
  RxBool ordersLoading = false.obs;
  var getStore = getIt.get<GetStorage>();
  var assignedOrdersUseCase = getIt.get<AssignedOrdersUseCase>();
  ValueNotifier<bool>? attandance = ValueNotifier<bool>(false);
  Rx<bool> attandanceVal = false.obs;
  Rx<bool> showAttandanceWidget = true.obs;
  Rx<bool> noFunctionClicked = false.obs;
  RxList<AssignedOrdersResponseModel> assignedOrders =
      <AssignedOrdersResponseModel>[].obs;

  getStatusOfAttandanceController() async {
    try {
      attendanceLoading.value = true;
      update();
      await assignedOrdersUseCase
          .getStatusOfAttandanceUseCase()
          .then((value) async {
        print("getting cont res>> ${value.message}");
        if (value.message == "Agent has not punched in.") {
          showAttandanceWidget.value = true;
          attandance = ValueNotifier(false);
          attandanceVal.value = false;
          // SnackBarUtil.errorSnackBar(value.message!);
          getStore.write("punch", "notpunched");
        } else if ((value.punchOutTime == "" || value.punchOutTime == null) &&
            (value.punchInTime != "" || value.punchInTime != null)) {
          showAttandanceWidget.value = true;
          attandance = ValueNotifier(true);
          attandanceVal.value = true;
          await getStore.write("punch", "punchin");
        } else {
          showAttandanceWidget.value = false;
          await getStore.write("punch", "punchout");
        }
        // if (value.message != null) {
        //   SnackBarUtil.successSnackBar(value.message!);
        // }
      });
      print("att....$attandance");
      attendanceLoading.value = false;
      update();
    } catch (e) {
      attendanceLoading.value = false;
      update();
    }
  }

  getPunchInController() async {
    try {
      attendanceLoading.value = true;
      update();

      await assignedOrdersUseCase.getPunchInUseCase().then((value) async {
        print("getting acces token>> ${value.message}");

        if (value.message == "Puch In Success") {
          attandance = ValueNotifier(true);
          attandanceVal.value = true;
          showAttandanceWidget.value = true;
          await getStore.write("punch", "punchin");
          // getAssignedOrdersController();
        }
        if (value.message != null) {
          SnackBarUtil.successSnackBar(value.message!);
        }
      });

      attendanceLoading.value = false;
      update();
    } catch (e) {
      attendanceLoading.value = false;
      update();
    }
  }

  getPunchOutController() async {
    try {
      attendanceLoading.value = true;
      update();
      await assignedOrdersUseCase.getPunchOutUseCase().then((value) async {
        print("getting acces token>> ${value.message}");
        if (value.message == "Puch Out Success") {
          attandance = ValueNotifier(false);
          attandanceVal.value = false;
          showAttandanceWidget.value = false;
          await getStore.write("punch", "punchout");
        }
        if (value.message != null) {
          SnackBarUtil.successSnackBar(value.message!);
        }
      });

      attendanceLoading.value = false;
      update();
    } catch (e) {
      attendanceLoading.value = false;
      update();
    }
  }

  getAssignedOrdersController() async {
    try {
      ordersLoading.value = true;
      update();
      assignedOrders.clear();
      await assignedOrdersUseCase
          .getAssignedOrdersUseCase()
          .then((value) async {
        if (value.isNotEmpty) {
          for (var item in value) {
            assignedOrders.add(item);
          }
        }
      });

      ordersLoading.value = false;
      update();
    } catch (e) {
      ordersLoading.value = false;
      update();
    }
  }
}

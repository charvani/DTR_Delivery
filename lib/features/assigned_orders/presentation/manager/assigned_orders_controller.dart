import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../../../../utils/snack_bar.dart';
import '../../domain/use_cases/assigned_orders_use_cases.dart';

class AssignedOrdersController extends GetxController {
  RxBool loading = false.obs;
  var getStore = getIt.get<GetStorage>();
  var assignedOrdersUseCase = getIt.get<AssignedOrdersUseCase>();

  getStatusOfAttandanceController() async {
    try {
      loading.value = true;
      update();

      await assignedOrdersUseCase
          .getStatusOfAttandanceUseCase()
          .then((value) async {
        print("getting acces token>> ${value.message}");

        if (value.message != null) {
          SnackBarUtil.successSnackBar(value.message!);
        }
      });

      loading.value = false;
      update();
    } catch (e) {
      loading.value = false;
      update();
    }
  }

  getPunchInController() async {
    try {
      loading.value = true;
      update();

      await assignedOrdersUseCase.getPunchInUseCase().then((value) async {
        print("getting acces token>> ${value.message}");
        if (value.message != null) {
          SnackBarUtil.successSnackBar(value.message!);
        }
      });

      loading.value = false;
      update();
    } catch (e) {
      loading.value = false;
      update();
    }
  }

  getPunchOutController() async {
    try {
      loading.value = true;
      update();

      await assignedOrdersUseCase.getPunchOutUseCase().then((value) async {
        print("getting acces token>> ${value.message}");

        if (value.message != null) {
          SnackBarUtil.successSnackBar(value.message!);
        }
      });

      loading.value = false;
      update();
    } catch (e) {
      loading.value = false;
      update();
    }
  }
  // getAssignedOrders() async {
  //   try {
  //     loading.value = true;
  //     refresh();
  //     final assignedOrdersRequestModel = AssignedOrdersRequestModel(
  //       password: AssignedOrdersPasswordController.text.trim(),
  //       contactNumber: phonenumberController.text.trim(),
  //     );
  //     await AssignedOrdersUseCase.getAssignedOrdersfoUseCase(
  //             AssignedOrdersRequestModel)
  //         .then((value) async {
  //       print("getting acces token>> ${value.accessToken}");

  //       // getStore.write("appAssignedOrders", "Yes");
  //       if (value.accessToken != null) {
  //         SnackBarUtil.successSnackBar(value.message);
  //       }
  //     });

  //     loading.value = false;
  //     update();
  //   } catch (e) {
  //     loading.value = false;
  //     update();
  //   }
  // }
}

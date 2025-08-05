import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/assigned_orders/data/models/mark_attandance_response_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../config/injector.dart';
import '../../../../utils/logger.dart';
import '../../../../utils/snack_bar.dart';
import '../repositories/assigned_orders_repository.dart';

class AssignedOrdersUseCase {
  // Adding Dependencies
  final smartLogger = logger(AssignedOrdersUseCase);
  var getStore = getIt.get<GetStorage>();

  AssignedOrdersRepository assignedOrdersRepository;

  AssignedOrdersUseCase(this.assignedOrdersRepository);

  Future<MarkAttandanceResponseModel> getStatusOfAttandanceUseCase() async {
    try {
      return await assignedOrdersRepository.getStatusOfAttandanceResponse();
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }

  Future<MarkAttandanceResponseModel> getPunchInUseCase() async {
    try {
      return await assignedOrdersRepository.getPunchInResponse();
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }

  Future<MarkAttandanceResponseModel> getPunchOutUseCase() async {
    try {
      return await assignedOrdersRepository.getPunchOutResponse();
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }
}

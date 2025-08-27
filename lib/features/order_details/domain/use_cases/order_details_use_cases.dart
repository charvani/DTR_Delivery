import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/order_details/data/models/pack_order_request_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../config/injector.dart';
import '../../../../utils/logger.dart';
import '../../../../utils/snack_bar.dart';
import '../../data/models/order_details_request_model.dart';
import '../../data/models/order_details_response_model.dart';
import '../repositories/order_details_repository.dart';

class OrderDetailsUseCase {
  // Adding Dependencies
  final smartLogger = logger(OrderDetailsUseCase);
  var getStore = getIt.get<GetStorage>();

  OrderDetailsRepository orderDetailsRepository;

  OrderDetailsUseCase(this.orderDetailsRepository);

  Future<OrderDetailsResponseModel> getOrderDetailsUseCase(
      OrderDetailsRequestModel orderDetailsRequestModel) async {
    try {
      return await orderDetailsRepository
          .getOrderDetailsRepository(orderDetailsRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }

  Future<dynamic> getClaimOrderUseCase(
      OrderDetailsRequestModel orderDetailsRequestModel) async {
    try {
      return await orderDetailsRepository
          .getClaimOrderRepository(orderDetailsRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }

  Future<dynamic> getPackingUseCase(
      PackOrderRequestModel packOrderRequestModel) async {
    try {
      return await orderDetailsRepository
          .getPackingRepository(packOrderRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }
}

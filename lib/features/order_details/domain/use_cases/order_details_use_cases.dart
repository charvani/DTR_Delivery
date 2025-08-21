import 'package:dio/dio.dart';
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
          .getOrderDetailsResponseRepository(orderDetailsRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }
}

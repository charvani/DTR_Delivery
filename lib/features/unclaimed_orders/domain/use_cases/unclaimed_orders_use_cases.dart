import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/unclaimed_orders/data/models/unclaimed_orders_response_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../config/injector.dart';
import '../../../../utils/logger.dart';
import '../../../../utils/snack_bar.dart';
import '../../data/models/unclaimed_orders_request_model.dart';
import '../repositories/unclaimed_orders_repository.dart';

class UnclaimedOrdersUseCase {
  // Adding Dependencies
  final smartLogger = logger(UnclaimedOrdersUseCase);
  var getStore = getIt.get<GetStorage>();

  UnclaimedOrdersRepository unclaimedOrdersRepository;

  UnclaimedOrdersUseCase(this.unclaimedOrdersRepository);

  Future<UnclaimedOrdersResponseModel> getUnclaimedOrdersUseCase(
      UnclaimedOrdersRequestModel unclaimedOrdersRequestModel) async {
    try {
      return await unclaimedOrdersRepository
          .getUnclaimedOrdersRepository(unclaimedOrdersRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }
}

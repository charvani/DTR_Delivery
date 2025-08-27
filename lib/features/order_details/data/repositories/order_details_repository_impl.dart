import 'package:logger/web.dart';

import '../../../../utils/network_info.dart';
import '../../../../utils/snack_bar.dart';
import '../../domain/repositories/order_details_repository.dart';
import '../data_sources/order_details_data_sources.dart';
import '../models/order_details_request_model.dart';
import '../models/order_details_response_model.dart';
import '../models/pack_order_request_model.dart';

class OrderDetailsRepositoryImpl extends OrderDetailsRepository {
  final NetworkInfoImpl networkInfoImpl;
  final OrderDetailsDataSource orderDetailsDataSource;

  OrderDetailsRepositoryImpl(this.orderDetailsDataSource, this.networkInfoImpl);

  @override
  Future<OrderDetailsResponseModel> getOrderDetailsRepository(
      OrderDetailsRequestModel orderDetailsRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await orderDetailsDataSource
          .getOrderDetailsDataSource(orderDetailsRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<dynamic> getClaimOrderRepository(
      OrderDetailsRequestModel orderDetailsRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await orderDetailsDataSource
          .getClaimOrderDataSource(orderDetailsRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<dynamic> getPackingRepository(
      PackOrderRequestModel packOrderRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await orderDetailsDataSource
          .getPackingDataSource(packOrderRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }
}

import 'package:dtr_delivery/features/order_details/data/models/order_details_response_model.dart';
import 'package:dtr_delivery/features/order_details/data/models/pack_order_request_model.dart';

import '../../data/models/order_details_request_model.dart';

abstract class OrderDetailsRepository {
  Future<OrderDetailsResponseModel> getOrderDetailsRepository(
      OrderDetailsRequestModel orderDetailsRequestModel);
  Future<dynamic> getClaimOrderRepository(
      OrderDetailsRequestModel orderDetailsRequestModel);
  Future<dynamic> getPackingRepository(
      PackOrderRequestModel packOrderRequestModel);
}

import 'package:dtr_delivery/features/order_details/data/models/order_details_response_model.dart';

import '../../data/models/order_details_request_model.dart';

abstract class OrderDetailsRepository {
  Future<OrderDetailsResponseModel> getOrderDetailsResponseRepository(
      OrderDetailsRequestModel orderDetailsRequestModel);
}


import '../../data/models/unclaimed_orders_request_model.dart';
import '../../data/models/unclaimed_orders_response_model.dart';

abstract class UnclaimedOrdersRepository {
  Future<UnclaimedOrdersResponseModel> getUnclaimedOrdersRepository(
      UnclaimedOrdersRequestModel unclaimedOrdersRequestModel);
}

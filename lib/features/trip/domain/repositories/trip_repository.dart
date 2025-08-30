
import '../../../unclaimed_orders/data/models/unclaimed_orders_request_model.dart';
import '../../data/models/previous_trips_response_model.dart';

abstract class TripRepository {
  Future<PreviousTripsResponseModel> getPrevioustripsRepository(
      UnclaimedOrdersRequestModel unclaimedOrdersRequestModel);
}

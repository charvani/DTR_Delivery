import 'package:dtr_delivery/features/trip/data/models/current_trip_response_model.dart';
import 'package:dtr_delivery/features/trip/data/models/reached_location_request_model.dart';

import '../../../unclaimed_orders/data/models/unclaimed_orders_request_model.dart';
import '../../data/models/previous_trips_response_model.dart';

abstract class TripRepository {
  Future<PreviousTripsResponseModel> getPrevioustripsRepository(
      UnclaimedOrdersRequestModel unclaimedOrdersRequestModel);
  Future<List<CurrentTripResponseModel>> getCurrentTripRepository();
  Future<dynamic> getReachedLocationRepository(
      ReachedLocationRequestModel reachedLocationRequestModel);
}

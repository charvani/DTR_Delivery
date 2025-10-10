import 'package:dtr_delivery/features/trip/data/models/current_trip_response_model.dart';
import 'package:dtr_delivery/features/trip/data/models/reached_location_request_model.dart';
import 'package:dtr_delivery/features/trip/data/models/report_vehicle_breakdown_model.dart';
import 'package:dtr_delivery/features/trip/data/models/return_order_request_model.dart';

import '../../../unclaimed_orders/data/models/unclaimed_orders_request_model.dart';
import '../../data/models/addfeedback_request_model.dart';
import '../../data/models/complete_delivery_request_model.dart';
import '../../data/models/previous_trips_response_model.dart';

abstract class TripRepository {
  Future<PreviousTripsResponseModel> getPrevioustripsRepository(
      UnclaimedOrdersRequestModel unclaimedOrdersRequestModel);
  Future<List<CurrentTripResponseModel>> getPrevioustTripDetailsRepository(
      ReachedLocationRequestModel reachedLocationRequestModel);

  Future<List<CurrentTripResponseModel>> getCurrentTripRepository();
  Future<dynamic> getReachedLocationRepository(
      ReachedLocationRequestModel reachedLocationRequestModel);
  Future<dynamic> getSendOtpRepository(
      ReachedLocationRequestModel reachedLocationRequestModel);
  Future<dynamic> getCompleteDeliveryRepository(
      CompleteDeliveryRequestModel completeDeliveryRequestModel);

  Future<dynamic> getReturnOrderRepository(
      ReturnOrderRequestModel returnOrderRequestModel);

  Future<dynamic> getReturnItemRepository(
      ReturnOrderRequestModel returnOrderRequestModel);
  Future<dynamic> getAddFeedbackRequestRepo(
      AddFeedbackRequestModel addFeedbackRequestModel);
  Future<dynamic> getReportVehicleBreakdownRequestRepo(
      ReportVehicleBreakdownRequestModel reportVehicleBreakdownRequestModel);
      Future<dynamic> getWithdrawVehicleBreakdownRequestRepo(
      ReportVehicleBreakdownRequestModel reportVehicleBreakdownRequestModel);
}

import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/trip/data/models/complete_delivery_request_model.dart';
import 'package:dtr_delivery/features/trip/data/models/current_trip_response_model.dart';
import 'package:dtr_delivery/features/trip/data/models/previous_trips_response_model.dart';
import 'package:dtr_delivery/features/trip/data/models/reached_location_request_model.dart';
import 'package:logger/logger.dart';

import '../../../../utils/logger.dart';
import '../../../../utils/snack_bar.dart';
import '../../../unclaimed_orders/data/models/unclaimed_orders_request_model.dart';
import '../repositories/trip_repository.dart';

class TripUseCase {
  // Adding Dependencies
  final smartLogger = logger(TripUseCase);
  // var getStore = getIt.get<GetStorage>();

  TripRepository tripRepository;

  TripUseCase(this.tripRepository);

  Future<PreviousTripsResponseModel> getPreviousTripUseCase(
      UnclaimedOrdersRequestModel unclaimedOrdersRequestModel) async {
    try {
      return await tripRepository
          .getPrevioustripsRepository(unclaimedOrdersRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }

  Future<List<CurrentTripResponseModel>> getCurrentTripUseCase() async {
    try {
      return await tripRepository.getCurrentTripRepository();
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }

  Future<dynamic> getReachedLocationUseCase(
      ReachedLocationRequestModel reachedLocationRequestModel) async {
    try {
      return await tripRepository
          .getReachedLocationRepository(reachedLocationRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }

  Future<dynamic> getSendOtpUseCase(
      ReachedLocationRequestModel reachedLocationRequestModel) async {
    try {
      return await tripRepository
          .getSendOtpRepository(reachedLocationRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }

  Future<dynamic> getCompleteDeliveryUseCase(
      CompleteDeliveryRequestModel completeDeliveryRequestModel) async {
    try {
      return await tripRepository
          .getCompleteDeliveryRepository(completeDeliveryRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }
}

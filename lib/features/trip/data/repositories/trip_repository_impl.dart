import 'package:logger/logger.dart';

import '../../../../utils/network_info.dart';
import '../../../../utils/snack_bar.dart';
import '../../../unclaimed_orders/data/models/unclaimed_orders_request_model.dart';
import '../../domain/repositories/trip_repository.dart';
import '../data_sources/trip_data_sources.dart';
import '../models/addfeedback_request_model.dart';
import '../models/complete_delivery_request_model.dart';
import '../models/current_trip_response_model.dart';
import '../models/previous_trips_response_model.dart';
import '../models/reached_location_request_model.dart';
import '../models/return_order_request_model.dart';

class TripRepositoryImpl extends TripRepository {
  final NetworkInfoImpl networkInfoImpl;
  final TripDataSources tripDataSource;

  TripRepositoryImpl(this.tripDataSource, this.networkInfoImpl);

  @override
  Future<PreviousTripsResponseModel> getPrevioustripsRepository(
      UnclaimedOrdersRequestModel unclaimedOrdersRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await tripDataSource
          .getPreviousTripsDataSource(unclaimedOrdersRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<List<CurrentTripResponseModel>> getCurrentTripRepository() async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await tripDataSource.getCurrentTripDataSource();
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<dynamic> getReachedLocationRepository(
      ReachedLocationRequestModel reachedLocationRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await tripDataSource
          .getReachedLocationDataSource(reachedLocationRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<dynamic> getSendOtpRepository(
      ReachedLocationRequestModel reachedLocationRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await tripDataSource
          .getSendOtpDataSource(reachedLocationRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<dynamic> getCompleteDeliveryRepository(
      CompleteDeliveryRequestModel completeDeliveryRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await tripDataSource
          .getCompleteDataSource(completeDeliveryRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<List<CurrentTripResponseModel>> getPrevioustTripDetailsRepository(
      ReachedLocationRequestModel reachedLocationRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await tripDataSource
          .getPrevioustTripDetailsDataSource(reachedLocationRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<dynamic> getReturnOrderRepository(
      ReturnOrderRequestModel returnOrderRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await tripDataSource
          .getReturnOrderDataSource(returnOrderRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<dynamic> getReturnItemRepository(
      ReturnOrderRequestModel returnOrderRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await tripDataSource
          .getReturnItemDataSource(returnOrderRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<dynamic> getAddFeedbackRequestRepo(
      AddFeedbackRequestModel addFeedbackRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await tripDataSource
          .getAddFeedbackDataSouce(addFeedbackRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }
}

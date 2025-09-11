import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/trip/data/models/complete_delivery_request_model.dart';
import 'package:dtr_delivery/features/trip/data/models/current_trip_response_model.dart';
import 'package:dtr_delivery/features/trip/data/models/reached_location_request_model.dart';
import 'package:dtr_delivery/features/unclaimed_orders/data/models/unclaimed_orders_request_model.dart';
import 'package:dtr_delivery/utils/snack_bar.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../models/previous_trips_response_model.dart';

class TripDataSources {
  String baseUrl;
  Dio dio;

  TripDataSources(this.dio, this.baseUrl);

  Future<dynamic> getPreviousTripsDataSource(
      UnclaimedOrdersRequestModel unclaimedOrdersRequestModel) async {
    try {
      Map<String, dynamic> bodyData = {
        "page": unclaimedOrdersRequestModel.page! * 10,
        "limit": unclaimedOrdersRequestModel.limit,
      };
      print("body data....$bodyData");
      print("body pAGE....${unclaimedOrdersRequestModel.page}");
      Response response =
          await dio.post('$baseUrl/get-agent-previous-trips', data: bodyData);
      print("recieved response: $response");

      print("recieved response222: ${response.data}");
      print(">>>>>  ${PreviousTripsResponseModel.fromJson(response.data)}");
      return PreviousTripsResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print("Status code: ${e.response?.statusCode}");
        print("Error body: ${e.response?.data}");
        SnackBarUtil.errorSnackBar(e.response?.data['error'] ?? "");
      } else {
        print("Request error: ${e.message}");
      }
      return PreviousTripsResponseModel();
    } catch (e) {
      // Any other error
      print("unexpected error >>> $e");
    }
  }

  Future<dynamic> getCurrentTripDataSource() async {
    try {
      Response response = await dio.get(
        '$baseUrl/get-agent-trip-details',
      );
      print("recieved response: $response");

      print("recieved response222: ${response.data}");

      List<dynamic> jsonList = response.data;
      List<CurrentTripResponseModel> dataList = [];
      for (var element in jsonList) {
        dataList.add(CurrentTripResponseModel.fromJson(element));
      }
      return dataList;
    } on DioException catch (e) {
      if (e.response != null) {
        print("Status code: ${e.response?.statusCode}");
        print("Error body: ${e.response?.data}");
        SnackBarUtil.errorSnackBar(e.response?.data['error'] ?? "");
      } else {
        print("Request error: ${e.message}");
      }
      return e.message;
    } catch (e) {
      // Any other error
      print("unexpected error >>> $e");
    }
  }

  Future<dynamic> getReachedLocationDataSource(
      ReachedLocationRequestModel reachedLocationRequestModel) async {
    print("Krushna...");
    print("acces stoke ...${getIt.get<GetStorage>().read("accessToken")}");
    try {
      Map bodyData = {"tripOrderId": reachedLocationRequestModel.tripOrderId};

      Response response = await dio
          .post('$baseUrl/location-reached-time-marking', data: bodyData);
      print("recieved location-reached-time-marking: $response");

      print("recieved location-reached-time-marking: ${response.data}");
      return response.data['message'];
    } catch (e) {
      // Any other error
      print("unexpected error >>> $e");
    }
  }

  Future<dynamic> getSendOtpDataSource(
      ReachedLocationRequestModel reachedLocationRequestModel) async {
    print("Krushna...");
    print("acces stoke ...${getIt.get<GetStorage>().read("accessToken")}");
    try {
      Map bodyData = {"tripOrderId": reachedLocationRequestModel.tripOrderId};

      Response response =
          await dio.post('$baseUrl/otp-sending', data: bodyData);
      print("recieved otp-sending: $response");

      print("recieved otp-sending: ${response.data}");
      return response.data['message'];
    } catch (e) {
      // Any other error
      print("unexpected error >>> $e");
    }
  }

  Future<dynamic> getCompleteDataSource(
      CompleteDeliveryRequestModel completeDeliveryRequestModel) async {
    print("Krushna...");
    print("acces stoke ...${getIt.get<GetStorage>().read("accessToken")}");
    try {
      Map bodyData = {
        "tripOrderId": completeDeliveryRequestModel.tripOrderId,
        "otp": completeDeliveryRequestModel.otp
      };
      print("body data .....$bodyData");
      Response response =
          await dio.post('$baseUrl/order-delivery', data: bodyData);
      print("recieved otp-sending: $response");
      print("recieved otp-sending: ${response.data}");
      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        print("Status code: ${e.response?.statusCode}");
        print("Error body: ${e.response?.data}");
        SnackBarUtil.errorSnackBar(e.response?.data['message'] ?? "");
      } else {
        print("Request error: ${e.message}");
      }
      return e.message;
    } catch (e) {
      // Any other error
      print("unexpected error >>> $e");
    }
  }
}

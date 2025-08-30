import 'package:dio/dio.dart';
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
    print("acces stoke ...${getIt.get<GetStorage>().read("accessToken")}");

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
}

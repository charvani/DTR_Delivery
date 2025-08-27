import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/order_details/data/models/order_details_response_model.dart';
import 'package:dtr_delivery/features/order_details/data/models/pack_order_request_model.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../models/order_details_request_model.dart';

class OrderDetailsDataSource {
  String baseUrl;
  Dio dio;

  OrderDetailsDataSource(this.dio, this.baseUrl);

  Future<dynamic> getOrderDetailsDataSource(
      OrderDetailsRequestModel orderDetailsRequestModel) async {
    print("acces stoke ...${getIt.get<GetStorage>().read("accessToken")}");

    try {
      Response response = await dio.get(
        '$baseUrl/get-agent-order-details/${orderDetailsRequestModel.orderId}',
      );
      print("OrderDetailsDataSources get punch data response ${response.data}");
      return OrderDetailsResponseModel.fromJson(response.data);
    } catch (e) {
      print("cache error .... $e");
    }
  }

  Future<dynamic> getClaimOrderDataSource(
      OrderDetailsRequestModel orderDetailsRequestModel) async {
    print("acces stoke ...${getIt.get<GetStorage>().read("accessToken")}");

    try {
      Response response = await dio.patch(
        '$baseUrl/assign-unclaimed-order/${orderDetailsRequestModel.orderId}',
      );
      return response.data;
    } catch (e) {
      print("cache error .... $e");
    }
  }

  Future<dynamic> getPackingDataSource(
      PackOrderRequestModel packOrderRequestModel) async {
    print("acces stoke ...${getIt.get<GetStorage>().read("accessToken")}");

    try {
      Map bodyData = {
        "orderId": packOrderRequestModel.orderId,
        "isInspectionStart": packOrderRequestModel.isInspectionStart
      };

      Response response = await dio.patch('$baseUrl/start-or-finish-inspection',
          data: bodyData);
      return response.data;
    } catch (e) {
      print("cache error .... $e");
    }
  }
}

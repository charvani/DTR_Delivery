import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/order_details/data/models/order_details_response_model.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';

class OrderDetailsDataSource {
  String baseUrl;
  Dio dio;

  OrderDetailsDataSource(this.dio, this.baseUrl);

  Future<dynamic> getOrderDetailsDataSource() async {
    print("acces stoke ...${getIt.get<GetStorage>().read("accessToken")}");

    try {
      Response response = await dio.get(
        '$baseUrl/get-agent-order-details/:',
      );
      print("OrderDetailsDataSources get punch data response ${response.data}");
      return OrderDetailsResponseModel.fromJson(response.data);
    } catch (e) {
      print("cache error .... $e");
    }
  }
}

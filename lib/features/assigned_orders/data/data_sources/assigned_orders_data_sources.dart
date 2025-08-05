import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/assigned_orders/data/models/mark_attandance_response_model.dart';

class AssignedOrdersDataSource {
  String baseUrl;
  Dio dio;

  AssignedOrdersDataSource(this.dio, this.baseUrl);

  Future<MarkAttandanceResponseModel> getStatusOfAttandanceDataSource() async {
    Response response = await dio.get(
      '$baseUrl/attendance-check',
    );
    print("AssignedOrders response ${response.data}");
    return MarkAttandanceResponseModel.fromJson(response.data);
  }

  Future<MarkAttandanceResponseModel> getSPunchInDataSource() async {
    Response response = await dio.get(
      '$baseUrl/attendance-punch-in',
    );
    print("AssignedOrders response ${response.data}");
    return MarkAttandanceResponseModel.fromJson(response.data);
  }

  Future<MarkAttandanceResponseModel> getPunchOutDataSource() async {
    Response response = await dio.get(
      '$baseUrl/attendance-punch-out',
    );
    print("AssignedOrders response ${response.data}");
    return MarkAttandanceResponseModel.fromJson(response.data);
  }
}

import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/assigned_orders/data/models/assigned_orders_response_model.dart';
import 'package:dtr_delivery/features/assigned_orders/data/models/mark_attandance_response_model.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/injector.dart';
import '../../../../utils/snack_bar.dart';

class AssignedOrdersDataSource {
  String baseUrl;
  Dio dio;

  AssignedOrdersDataSource(this.dio, this.baseUrl);

  Future<MarkAttandanceResponseModel> getStatusOfAttandanceDataSource() async {
    print("acces stoke ...${getIt.get<GetStorage>().read("accessToken")}");

    try {
      Response response = await dio.get(
        '$baseUrl/attendance-check',
      );
      print("AssignedOrders get punch data response ${response.data}");
      return MarkAttandanceResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print("Status code: ${e.response?.statusCode}");
        print("Error body: ${e.response?.data}");
        SnackBarUtil.errorSnackBar(e.response?.data['message'] ?? "");
      } else {
        print("Request error: ${e.message}");
      }
      return MarkAttandanceResponseModel(
        message: "Agent has not punched in.",
      );
    } catch (e) {
      print("cache error .... $e");
      return MarkAttandanceResponseModel(
        message: "Agent has not punched in.",
      );
    }
  }

  Future<MarkAttandanceResponseModel> getSPunchInDataSource() async {
    Response response = await dio.post(
      '$baseUrl/attendance-punch-in',
    );
    print("AssignedOrders punch in response ${response.data}");
    return MarkAttandanceResponseModel.fromJson(response.data);
  }

  Future<MarkAttandanceResponseModel> getPunchOutDataSource() async {
    Response response = await dio.put(
      '$baseUrl/attendance-punch-out',
    );
    print("AssignedOrders punch iut response ${response.data}");
    return MarkAttandanceResponseModel.fromJson(response.data);
  }

  Future<dynamic> getAssignedOrdersDataSouce() async {
    try {
      Response response = await dio.get('$baseUrl/get-agent-assigned-orders');

      print("recieved response: $response");
      List<dynamic> jsonList = response.data;
      List<AssignedOrdersResponseModel> dataList = [];
      for (var element in jsonList) {
        dataList.add(AssignedOrdersResponseModel.fromJson(element));
      }
      return dataList;
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
      print("get err >> $e");
    }
  }
}

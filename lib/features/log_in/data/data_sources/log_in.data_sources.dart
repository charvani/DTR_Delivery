import 'package:dio/dio.dart';

import '../models/log_in_request.model.dart';
import '../models/log_in_response.model.dart';

class LogInDataSource {
  String baseUrl;
  Dio dio;

  LogInDataSource(this.dio, this.baseUrl);

  Future<LoginResponseModel> getLogIn(
      LoginRequestModel logInRequestModel) async {
    Map bodyData = {
      "contactNumber": logInRequestModel.contactNumber,
      "password": logInRequestModel.password
    };
    print("singin b Data>> $bodyData");
    Response response =
        await dio.post('$baseUrl/delivery-login', data: bodyData);
    print("login response ${response.data}");
    return LoginResponseModel.fromJson(response.data);
  }
}

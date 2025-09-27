import 'package:dio/dio.dart';

import '../../../../utils/snack_bar.dart';
import '../model/change_password_request_model.dart';

class UserAccountDataSources {
  String baseUrl;
  Dio dio;

  UserAccountDataSources(this.dio, this.baseUrl);

  //funcuton

  Future<dynamic> getChangePasswordDataSource(
      ChangePasswordRequestModel changePasswordRequestModel) async {
    try {
      Map bodyData = {
        "oldPassword": changePasswordRequestModel.oldPassword,
        "newPassword": changePasswordRequestModel.newPassword,
      };
      print("singin b Data>> $bodyData");
      Response response = await dio.post('$baseUrl/password', data: bodyData);
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
      print("get error >>> $e");
    }
  }
}

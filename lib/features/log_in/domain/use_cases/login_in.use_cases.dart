import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../config/injector.dart';
import '../../../../utils/logger.dart';
import '../../data/models/log_in_request.model.dart';
import '../../data/models/log_in_response.model.dart';
import '../repositories/login_in.repository.dart';

class LogInUseCase {
  // Adding Dependencies
  final smartLogger = logger(LogInUseCase);
  var getStore = getIt.get<GetStorage>();

  LogInRepository logInRepository;

  LogInUseCase(this.logInRepository);

  Future<LoginResponseModel> getLogInfoUseCase(
      LoginRequestModel logInRequestModel) async {
    try {
      return await logInRepository.getLogInfo(logInRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      // SnackBarUtil.errorSnackBar(e.response!.data['message']);
      throw Exception(e);
    }
  }
}

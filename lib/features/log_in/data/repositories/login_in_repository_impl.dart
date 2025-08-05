
import 'package:logger/web.dart';

import '../../../../utils/network_info.dart';
import '../../../../utils/snack_bar.dart';
import '../../domain/repositories/login_in.repository.dart';
import '../data_sources/log_in.data_sources.dart';
import '../models/log_in_request.model.dart';
import '../models/log_in_response.model.dart';

class LogInRepositoryImpl extends LogInRepository {
  final NetworkInfoImpl networkInfoImpl;
  final LogInDataSource logInDataSource;

  LogInRepositoryImpl(this.logInDataSource, this.networkInfoImpl);

  @override
  Future<LoginResponseModel> getLogInfo(
      LoginRequestModel logInRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await logInDataSource.getLogIn(logInRequestModel);
    }

    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }
}

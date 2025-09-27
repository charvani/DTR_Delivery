import 'package:logger/logger.dart';

import '../../../../utils/network_info.dart';
import '../../../../utils/snack_bar.dart';
import '../../domain/repository/user_account_repository.dart';
import '../data_source/user_account_data_sources.dart';
import '../model/change_password_request_model.dart';

class UserAccountRepositoryImpl extends UserAccountRepository {
  final NetworkInfoImpl networkInfoImpl;
  final UserAccountDataSources userAccountDataSources;

  UserAccountRepositoryImpl(
      this.userAccountDataSources, this.networkInfoImpl);


      @override
  Future<dynamic> getChangePasswordRepo(
      ChangePasswordRequestModel changePasswordRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await userAccountDataSources
          .getChangePasswordDataSource(changePasswordRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }
}

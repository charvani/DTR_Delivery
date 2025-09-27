import '../../data/model/change_password_request_model.dart';

abstract class UserAccountRepository {
    Future<dynamic> getChangePasswordRepo(
      ChangePasswordRequestModel changePasswordRequestModel);
}

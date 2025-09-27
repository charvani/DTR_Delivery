import 'package:dio/dio.dart';
import 'package:dtr_delivery/features/log_in/presentation/pages/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import '../../../../config/injector.dart';
import '../../../../utils/logger.dart';
import '../../../../utils/snack_bar.dart';
import '../../data/model/change_password_request_model.dart';
import '../repository/user_account_repository.dart';

class UserAccountUsecase {
  final smartLogger = logger(UserAccountUsecase);
  var getStore = getIt.get<GetStorage>();
  UserAccountRepository userAccountRepository;
  UserAccountUsecase(this.userAccountRepository);

  
  Future<dynamic> getChangePasswordUseCase(
      ChangePasswordRequestModel changePasswordRequestModel) async {
    try {
      return await userAccountRepository
          .getChangePasswordRepo(changePasswordRequestModel);
    } on DioException catch (e) {
      Logger().i(e);
      smartLogger().i(e);
      SnackBarUtil.errorSnackBar(e.response!.data['message']);
      if (e.response!.data['error'] == "Invalid or expired token") {
        Get.offAll(() => LoginScreen());
      }
      throw Exception(e);
    }
  }
}

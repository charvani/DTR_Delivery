
import '../../data/models/log_in_request.model.dart';
import '../../data/models/log_in_response.model.dart';

abstract class LogInRepository {
 
  Future<LoginResponseModel> getLogInfo(
      LoginRequestModel logInRequestModel);
}

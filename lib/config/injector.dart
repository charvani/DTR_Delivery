import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../features/log_in/data/data_sources/log_in.data_sources.dart';
import '../features/log_in/data/repositories/login_in_repository_impl.dart';
import '../features/log_in/domain/repositories/login_in.repository.dart';
import '../features/log_in/domain/use_cases/login_in.use_cases.dart';
import '../routes/routes.dart';
import '../utils/network_info.dart';
import '../utils/snack_bar.dart';
import 'app/app_config.dart';
import 'app/config_demo.dart';
import 'app/config_prod.dart';
import 'flavour.dart';

var getIt = GetIt.instance;
var dio = Dio();

Future<void> init(FlavorEnum flavor) async {
/*
Login Dependency Injection
*/
  getIt.registerLazySingleton<LogInDataSource>(
      () => LogInDataSource(dio, getIt.get<AppConfig>().baseUrl));
  getIt.registerLazySingleton<LogInUseCase>(
      () => LogInUseCase(getIt.get<LogInRepository>()));
  getIt.registerLazySingleton<LogInRepository>(
      () => LogInRepositoryImpl(getIt(), getIt()));

/*
    Project Network Info Impl
  */
  getIt.registerLazySingleton<NetworkInfoImpl>(() => NetworkInfoImpl());

  /*
    Project Configuration
  */
  getIt.registerSingleton<AppConfig>(
      (flavor == FlavorEnum.demo) ? ConfigDemo() : ConfigProd());

  /*
    Firebase Configuration
  */
  // getIt.registerLazySingleton<FirebaseApi>(
  //     () => FirebaseApi(dio, getIt.get<AppConfig>().baseUrl));

  /*
   3rd Party Package dependencies
  */
  await GetStorage.init();
  getIt.registerLazySingleton<GetStorage>(() => GetStorage());
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    // Add accessToken to the request
    if (getIt.get<GetStorage>().read("accessToken") != null) {
      options.headers = {
        'Authorization': 'Bearer ${getIt.get<GetStorage>().read("accessToken")}'
      };
    }
    // Do something before request is sent
    return handler.next(options); //continue
    // If you want to resolve the request with some custom data，
    // you can resolve a `Response` object eg: `handler.resolve(response)`.
    // If you want to reject the request with a error message,
    // you can reject a `DioError` object eg: `handler.reject(dioError)`
  }, onResponse: (response, handler) {
    // Do something with response data
    return handler.next(response); // continue
    // If you want to reject the request with a error message,
    // you can reject a `DioError` object eg: `handler.reject(dioError)`
  }, onError: (DioException e, handler) {
    if (e.response?.statusCode == 401) {
      print("get dio exception e >>>  ${e.response?.data}");
      if (e.response!.data['message'] == "Invalid or expired token" ||
          e.response!.data['error'] == "Unauthorized") {
        getIt.get<GetStorage>().erase();
        Get.offNamed(Routes.getLoginRoute());
      }
      SnackBarUtil.errorSnackBar(e.response?.data['message']);
    }
    // Do something with response error
    return handler.next(e); //continue
    // If you want to resolve the request with some custom data，
    // you can resolve a `Response` object eg: `handler.resolve(response)`.
  }));
}

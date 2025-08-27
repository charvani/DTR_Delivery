import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../features/assigned_orders/data/data_sources/assigned_orders_data_sources.dart';
import '../features/assigned_orders/data/repositories/assigned_orders_repository_impl.dart';
import '../features/assigned_orders/domain/repositories/assigned_orders_repository.dart';
import '../features/assigned_orders/domain/use_cases/assigned_orders_use_cases.dart';
import '../features/log_in/data/data_sources/log_in.data_sources.dart';
import '../features/log_in/data/repositories/login_in_repository_impl.dart';
import '../features/log_in/domain/repositories/login_in.repository.dart';
import '../features/log_in/domain/use_cases/login_in.use_cases.dart';
import '../features/order_details/data/data_sources/order_details_data_sources.dart';
import '../features/order_details/data/repositories/order_details_repository_impl.dart';
import '../features/order_details/domain/repositories/order_details_repository.dart';
import '../features/order_details/domain/use_cases/order_details_use_cases.dart';
import '../features/trip/data/data_sources/trip_data_sources.dart';
import '../features/trip/data/repositories/trip_repository_impl.dart';
import '../features/trip/domain/repositories/trip_repository.dart';
import '../features/trip/domain/use_cases/trip_use_cases.dart';
import '../features/unclaimed_orders/data/data_sources/unclaimed_orders_data_sources.dart';
import '../features/unclaimed_orders/data/repositories/unclaimed_orders_repository_impl.dart';
import '../features/unclaimed_orders/domain/repositories/unclaimed_orders_repository.dart';
import '../features/unclaimed_orders/domain/use_cases/unclaimed_orders_use_cases.dart';
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
AssignedOrders Dependency Injection
*/
  getIt.registerLazySingleton<AssignedOrdersDataSource>(
      () => AssignedOrdersDataSource(dio, getIt.get<AppConfig>().baseUrl));
  getIt.registerLazySingleton<AssignedOrdersUseCase>(
      () => AssignedOrdersUseCase(getIt.get<AssignedOrdersRepository>()));
  getIt.registerLazySingleton<AssignedOrdersRepository>(
      () => AssignedOrdersRepositoryImpl(getIt(), getIt()));

  /*
UnclaimedOrders Dependency Injection
*/
  getIt.registerLazySingleton<UnclaimedOrdersDataSource>(
      () => UnclaimedOrdersDataSource(dio, getIt.get<AppConfig>().baseUrl));
  getIt.registerLazySingleton<UnclaimedOrdersUseCase>(
      () => UnclaimedOrdersUseCase(getIt.get<UnclaimedOrdersRepository>()));
  getIt.registerLazySingleton<UnclaimedOrdersRepository>(
      () => UnclaimedOrdersRepositoryImpl(getIt(), getIt()));

  /*
OrderDetails Dependency Injection
*/
  getIt.registerLazySingleton<OrderDetailsDataSource>(
      () => OrderDetailsDataSource(dio, getIt.get<AppConfig>().baseUrl));
  getIt.registerLazySingleton<OrderDetailsUseCase>(
      () => OrderDetailsUseCase(getIt.get<OrderDetailsRepository>()));
  getIt.registerLazySingleton<OrderDetailsRepository>(
      () => OrderDetailsRepositoryImpl(getIt(), getIt()));


  /*
Trips Dependency Injection
*/
  getIt.registerLazySingleton<TripDataSources>(
      () => TripDataSources(dio, getIt.get<AppConfig>().baseUrl));
  getIt.registerLazySingleton<TripUseCase>(
      () => TripUseCase(getIt.get<TripRepository>()));
  getIt.registerLazySingleton<TripRepository>(
      () => TripRepositoryImpl(getIt(), getIt()));     

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

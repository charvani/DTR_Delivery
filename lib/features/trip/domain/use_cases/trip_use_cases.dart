import '../../../../utils/logger.dart';
import '../repositories/trip_repository.dart';

class TripUseCase {
  // Adding Dependencies
  final smartLogger = logger(TripUseCase);
  // var getStore = getIt.get<GetStorage>();

  TripRepository tripRepository;

  TripUseCase(this.tripRepository);

  // Future<TripResponseModel> getTripUseCase(
  //     TripRequestModel TripRequestModel) async {
  //   try {
  //     return await TripRepository
  //         .getTripRepository(TripRequestModel);
  //   } on DioException catch (e) {
  //     Logger().i(e);
  //     SnackBarUtil.errorSnackBar(e.response!.data['message']);
  //     throw Exception(e);
  //   }
  // }
}

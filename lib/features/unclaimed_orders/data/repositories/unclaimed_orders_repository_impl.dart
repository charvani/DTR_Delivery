import 'package:logger/logger.dart';

import '../../../../utils/network_info.dart';
import '../../../../utils/snack_bar.dart';
import '../../domain/repositories/unclaimed_orders_repository.dart';
import '../data_sources/unclaimed_orders_data_sources.dart';
import '../models/unclaimed_orders_request_model.dart';
import '../models/unclaimed_orders_response_model.dart';

class UnclaimedOrdersRepositoryImpl extends UnclaimedOrdersRepository {
  final NetworkInfoImpl networkInfoImpl;
  final UnclaimedOrdersDataSource unclaimedOrdersDataSource;

  UnclaimedOrdersRepositoryImpl(
      this.unclaimedOrdersDataSource, this.networkInfoImpl);

   @override
  Future<UnclaimedOrdersResponseModel> getUnclaimedOrdersRepository(
      UnclaimedOrdersRequestModel unclaimedOrdersRequestModel) async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await unclaimedOrdersDataSource.getUnclaimedOrdersDataSource(unclaimedOrdersRequestModel);
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }
}

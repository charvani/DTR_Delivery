import 'package:logger/web.dart';

import '../../../../utils/network_info.dart';
import '../../../../utils/snack_bar.dart';
import '../../domain/repositories/assigned_orders_repository.dart';
import '../data_sources/assigned_orders_data_sources.dart';
import '../models/mark_attandance_response_model.dart';

class AssignedOrdersRepositoryImpl extends AssignedOrdersRepository {
  final NetworkInfoImpl networkInfoImpl;
  final AssignedOrdersDataSource assignedOrdersDataSource;

  AssignedOrdersRepositoryImpl(
      this.assignedOrdersDataSource, this.networkInfoImpl);

 

   @override
  Future<MarkAttandanceResponseModel> getStatusOfAttandanceResponse() async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await assignedOrdersDataSource.getStatusOfAttandanceDataSource();
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }
   @override
  Future<MarkAttandanceResponseModel> getPunchInResponse() async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await assignedOrdersDataSource.getSPunchInDataSource();
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }

  @override
  Future<MarkAttandanceResponseModel> getPunchOutResponse() async {
    Logger().i(networkInfoImpl.isConnected);
    Logger().i('networkInfoImpl');
    if (await networkInfoImpl.isConnected) {
      return await assignedOrdersDataSource.getPunchOutDataSource();
    }
    SnackBarUtil.errorSnackBar("No Internet Connection");
    throw Exception("No Internet Connection");
  }
}

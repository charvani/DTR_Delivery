import 'package:dtr_delivery/features/assigned_orders/data/models/mark_attandance_response_model.dart';

import '../../data/models/assigned_orders_response_model.dart';

abstract class AssignedOrdersRepository {
  Future<MarkAttandanceResponseModel> getStatusOfAttandanceResponse();
  Future<MarkAttandanceResponseModel> getPunchInResponse();
  Future<MarkAttandanceResponseModel> getPunchOutResponse();
  Future<List<AssignedOrdersResponseModel>> getAssignedOrdersRepository();
}

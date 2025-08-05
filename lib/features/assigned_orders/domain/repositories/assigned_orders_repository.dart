import 'package:dtr_delivery/features/assigned_orders/data/models/mark_attandance_response_model.dart';

abstract class AssignedOrdersRepository {
  // Future<AssignedOrdersResponseModel> getAssignedOrdersfo(
  //     AssignedOrdersRequestModel AssignedOrdersRequestModel);
  Future<MarkAttandanceResponseModel> getStatusOfAttandanceResponse();
  Future<MarkAttandanceResponseModel> getPunchInResponse();
  Future<MarkAttandanceResponseModel> getPunchOutResponse();
}

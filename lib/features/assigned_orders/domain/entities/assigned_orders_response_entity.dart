import '../../data/models/assigned_orders_response_model.dart';

class AssignedOrdersResponseEntity {
  String? id;
  double? orderValue;
  String? customerName;
  String? customerMobileNumber;
  OrderAddress? orderAddress;
  String? orderDate;
  String? orderStatus;
  String? orderPaymentMode;
  List<OrderDetails>? orderDetails;

  AssignedOrdersResponseEntity(
      {this.id,
      this.orderValue,
      this.customerName,
      this.customerMobileNumber,
      this.orderAddress,
      this.orderDate,
      this.orderStatus,
      this.orderPaymentMode,
      this.orderDetails});
}

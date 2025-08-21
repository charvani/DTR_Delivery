import '../../data/models/unclaimed_orders_response_model.dart';

class UnclaimedOrdersResponseEntity {
  int? total;
  List<Orders>? orders;

  UnclaimedOrdersResponseEntity({this.total, this.orders});
}

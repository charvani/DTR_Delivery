import '../../data/models/order_details_response_model.dart';

class OrderDetailsResponseEntity {
  Order? order;
  List<OrderDetails>? orderDetails;
  Address? address;
  User? user;

  OrderDetailsResponseEntity(
      {this.order, this.orderDetails, this.address, this.user});
}

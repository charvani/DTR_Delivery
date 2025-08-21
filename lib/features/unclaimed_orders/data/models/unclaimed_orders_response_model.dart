class UnclaimedOrdersResponseModel {
  int? total;
  List<Orders>? orders;

  UnclaimedOrdersResponseModel({this.total, this.orders});

  UnclaimedOrdersResponseModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String? orderId;
  dynamic orderValue;
  String? customerName;
  String? customerMobileNumber;
  OrderAddress? orderAddress;
  String? orderDate;
  String? orderStatus;
  String? orderPaymentMode;
  List<dynamic>? orderDetails;

  Orders(
      {this.orderId,
      this.orderValue,
      this.customerName,
      this.customerMobileNumber,
      this.orderAddress,
      this.orderDate,
      this.orderStatus,
      this.orderPaymentMode,
      this.orderDetails});

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderValue = json['orderValue'];
    customerName = json['customerName'];
    customerMobileNumber = json['customerMobileNumber'];
    orderAddress = json['orderAddress'] != null
        ? OrderAddress.fromJson(json['orderAddress'])
        : null;
    orderDate = json['orderDate'];
    orderStatus = json['orderStatus'];
    orderPaymentMode = json['orderPaymentMode'];
    if (json['orderDetails'] != null) {
      orderDetails = <Null>[];
      // json['orderDetails'].forEach((v) {
      //   orderDetails!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['orderValue'] = orderValue;
    data['customerName'] = customerName;
    data['customerMobileNumber'] = customerMobileNumber;
    if (orderAddress != null) {
      data['orderAddress'] = orderAddress!.toJson();
    }
    data['orderDate'] = orderDate;
    data['orderStatus'] = orderStatus;
    data['orderPaymentMode'] = orderPaymentMode;
    if (orderDetails != null) {
      data['orderDetails'] = orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderAddress {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postalCode;

  OrderAddress(
      {this.address1, this.address2, this.city, this.state, this.postalCode});

  OrderAddress.fromJson(Map<String, dynamic> json) {
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address1'] = address1;
    data['address2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['postalCode'] = postalCode;
    return data;
  }
}

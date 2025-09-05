class CurrentTripResponseModel {
  dynamic tripOrderId;
  dynamic tripId;
  num? totalOrders;
  dynamic orderId;
  num? orderTotal;
  dynamic status;
  dynamic orderAmountCollected;
  dynamic amountCollected;
  dynamic customerName;
  dynamic customerPhone;
  int? agentId;
  dynamic riderName;
  int? ordersDelivered;
  dynamic vehicleNumber;
  dynamic vehcileName;
  dynamic startTime;
  dynamic endTime;
  dynamic cancelledReason;
  dynamic cancelledAt;
  int? weight;
  dynamic paymentMode;
  dynamic reachedTime;
  dynamic deliveredTime;
  int? originalOrder;
  dynamic deliveredOrder;
  dynamic otp;
  dynamic otpVerifiedAt;
  bool? isCancelled;
  Address? address;
  List<OrderDetails>? orderDetails;

  CurrentTripResponseModel(
      {this.tripOrderId,
      this.tripId,
      this.totalOrders,
      this.orderId,
      this.orderTotal,
      this.status,
      this.orderAmountCollected,
      this.amountCollected,
      this.customerName,
      this.customerPhone,
      this.agentId,
      this.riderName,
      this.ordersDelivered,
      this.vehicleNumber,
      this.vehcileName,
      this.startTime,
      this.endTime,
      this.cancelledReason,
      this.cancelledAt,
      this.weight,
      this.paymentMode,
      this.reachedTime,
      this.deliveredTime,
      this.originalOrder,
      this.deliveredOrder,
      this.otp,
      this.otpVerifiedAt,
      this.isCancelled,
      this.address,
      this.orderDetails});

  CurrentTripResponseModel.fromJson(Map<String, dynamic> json) {
    tripOrderId = json['tripOrderId'];
    tripId = json['tripId'];
    totalOrders = json['totalOrders'];
    orderId = json['orderId'];
    orderTotal = json['orderTotal'];
    status = json['status'];
    orderAmountCollected = json['orderAmountCollected'];
    amountCollected = json['amountCollected'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    agentId = json['agentId'];
    riderName = json['riderName'];
    ordersDelivered = json['ordersDelivered'];
    vehicleNumber = json['vehicleNumber'];
    vehcileName = json['vehcileName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    cancelledReason = json['cancelledReason'];
    cancelledAt = json['cancelledAt'];
    weight = json['weight'];
    paymentMode = json['paymentMode'];
    reachedTime = json['reachedTime'];
    deliveredTime = json['deliveredTime'];
    originalOrder = json['originalOrder'];
    deliveredOrder = json['deliveredOrder'];
    otp = json['otp'];
    otpVerifiedAt = json['otpVerifiedAt'];
    isCancelled = json['isCancelled'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetails>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tripOrderId'] = tripOrderId;
    data['tripId'] = tripId;
    data['totalOrders'] = totalOrders;
    data['orderId'] = orderId;
    data['orderTotal'] = orderTotal;
    data['status'] = status;
    data['orderAmountCollected'] = orderAmountCollected;
    data['amountCollected'] = amountCollected;
    data['customerName'] = customerName;
    data['agentId'] = agentId;
    data['riderName'] = riderName;
    data['ordersDelivered'] = ordersDelivered;
    data['vehicleNumber'] = vehicleNumber;
    data['vehcileName'] = vehcileName;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['cancelledReason'] = cancelledReason;
    data['cancelledAt'] = cancelledAt;
    data['weight'] = weight;
    data['paymentMode'] = paymentMode;
    data['reachedTime'] = reachedTime;
    data['deliveredTime'] = deliveredTime;
    data['originalOrder'] = originalOrder;
    data['deliveredOrder'] = deliveredOrder;
    data['otp'] = otp;
    data['otpVerifiedAt'] = otpVerifiedAt;
    data['isCancelled'] = isCancelled;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (orderDetails != null) {
      data['orderDetails'] = orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postalCode;

  Address(
      {this.address1, this.address2, this.city, this.state, this.postalCode});

  Address.fromJson(Map<String, dynamic> json) {
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

class OrderDetails {
  dynamic cgst;
  dynamic igst;
  dynamic sgst;
  List<String>? images;
  int? quantity;
  int? productId;
  dynamic productName;
  num? pricePerUnit;
  num? originalPrice;

  OrderDetails(
      {this.cgst,
      this.igst,
      this.sgst,
      this.images,
      this.quantity,
      this.productId,
      this.productName,
      this.pricePerUnit,
      this.originalPrice});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    cgst = json['cgst'];
    igst = json['igst'];
    sgst = json['sgst'];
    images = json['images'].cast<String>();
    quantity = json['quantity'];
    productId = json['productId'];
    productName = json['productName'];
    pricePerUnit = json['pricePerUnit'];
    originalPrice = json['originalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cgst'] = cgst;
    data['igst'] = igst;
    data['sgst'] = sgst;
    data['images'] = images;
    data['quantity'] = quantity;
    data['productId'] = productId;
    data['productName'] = productName;
    data['pricePerUnit'] = pricePerUnit;
    return data;
  }
}

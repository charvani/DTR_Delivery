class OrderDetailsResponseModel {
  Order? order;
  List<OrderDetails>? orderDetails;
  Address? address;
  User? user;

  OrderDetailsResponseModel(
      {this.order, this.orderDetails, this.address, this.user});

  OrderDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetails>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(OrderDetails.fromJson(v));
      });
    }
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (orderDetails != null) {
      data['orderDetails'] = orderDetails!.map((v) => v.toJson()).toList();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Order {
  String? id;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? addressId;
  num? total;
  dynamic razorpayOrderId;
  dynamic expectedDeliveryDate;
  String? paymentMode;
  dynamic paymentStatus;
  String? expiresAt;
  bool? isPaymentCompleted;
  dynamic paidAmount;
  String? checkoutDiscount;
  dynamic paymentGatewayStatus;
  bool? hasFetchedPaymentData;
  bool? paidInFull;
  dynamic refundedAmount;
  dynamic paymentReferenceNumber;
  dynamic paymentReferenceUrl;
  bool? hasCancels;
  dynamic cancellationAmount;
  String? status;
  bool? hasProcessedByPincode;
  bool? cannotAssign;
  dynamic reason;
  bool? deliveryByThirdParty;
  dynamic tripOrderId;
  dynamic providerId;
  dynamic isInspectionStarted;
  int? isFeedbackGiven;

  Order(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.addressId,
      this.total,
      this.razorpayOrderId,
      this.expectedDeliveryDate,
      this.paymentMode,
      this.paymentStatus,
      this.expiresAt,
      this.isPaymentCompleted,
      this.paidAmount,
      this.checkoutDiscount,
      this.paymentGatewayStatus,
      this.hasFetchedPaymentData,
      this.paidInFull,
      this.refundedAmount,
      this.paymentReferenceNumber,
      this.paymentReferenceUrl,
      this.hasCancels,
      this.cancellationAmount,
      this.status,
      this.hasProcessedByPincode,
      this.cannotAssign,
      this.reason,
      this.deliveryByThirdParty,
      this.tripOrderId,
      this.providerId,
      this.isFeedbackGiven,
      this.isInspectionStarted});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    addressId = json['addressId'];
    total = json['total'];
    razorpayOrderId = json['razorpayOrderId'];
    expectedDeliveryDate = json['expectedDeliveryDate'];
    paymentMode = json['paymentMode'];
    paymentStatus = json['paymentStatus'];
    expiresAt = json['expiresAt'];
    isPaymentCompleted = json['isPaymentCompleted'];
    paidAmount = json['paidAmount'];
    checkoutDiscount = json['checkoutDiscount'];
    paymentGatewayStatus = json['paymentGatewayStatus'];
    hasFetchedPaymentData = json['hasFetchedPaymentData'];
    paidInFull = json['paidInFull'];
    refundedAmount = json['refundedAmount'];
    paymentReferenceNumber = json['paymentReferenceNumber'];
    paymentReferenceUrl = json['paymentReferenceUrl'];
    hasCancels = json['hasCancels'];
    cancellationAmount = json['cancellationAmount'];
    status = json['status'];
    hasProcessedByPincode = json['hasProcessedByPincode'];
    cannotAssign = json['cannotAssign'];
    reason = json['reason'];
    deliveryByThirdParty = json['deliveryByThirdParty'];
    tripOrderId = json['tripOrderId'];
    providerId = json['providerId'];
    isFeedbackGiven = json['isFeedbackGiven'];
    isInspectionStarted = json['isInspectionStarted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    data['addressId'] = addressId;
    data['total'] = total;
    data['razorpayOrderId'] = razorpayOrderId;
    data['expectedDeliveryDate'] = expectedDeliveryDate;
    data['paymentMode'] = paymentMode;
    data['paymentStatus'] = paymentStatus;
    data['expiresAt'] = expiresAt;
    data['isPaymentCompleted'] = isPaymentCompleted;
    data['paidAmount'] = paidAmount;
    data['checkoutDiscount'] = checkoutDiscount;
    data['paymentGatewayStatus'] = paymentGatewayStatus;
    data['hasFetchedPaymentData'] = hasFetchedPaymentData;
    data['paidInFull'] = paidInFull;
    data['refundedAmount'] = refundedAmount;
    data['paymentReferenceNumber'] = paymentReferenceNumber;
    data['paymentReferenceUrl'] = paymentReferenceUrl;
    data['hasCancels'] = hasCancels;
    data['cancellationAmount'] = cancellationAmount;
    data['status'] = status;
    data['hasProcessedByPincode'] = hasProcessedByPincode;
    data['cannotAssign'] = cannotAssign;
    data['reason'] = reason;
    data['deliveryByThirdParty'] = deliveryByThirdParty;
    data['tripOrderId'] = tripOrderId;
    data['providerId'] = providerId;
    data['isInspectionStarted'] = isInspectionStarted;
    return data;
  }
}

class OrderDetails {
  num? price;
  int? quantity;
  int? productId;
  num? itemMrp;
  int? productQuantity;
  String? productName;
  bool? isCancelled;
  bool? isDamaged;
  String? cgst;
  String? igst;
  String? sgst;
  dynamic packageSize;
  dynamic metric;
  List<String>? images;

  OrderDetails(
      {this.price,
      this.quantity,
      this.productId,
      this.itemMrp,
      this.productQuantity,
      this.productName,
      this.isCancelled,
      this.isDamaged,
      this.cgst,
      this.igst,
      this.sgst,
      this.packageSize,
      this.metric,
      this.images});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    quantity = json['quantity'];
    productId = json['productId'];
    itemMrp = json['item_mrp'];
    productQuantity = json['product_quantity'];
    productName = json['productName'];
    isCancelled = json['isCancelled'];
    isDamaged = json['isDamaged'];
    cgst = json['cgst'];
    igst = json['igst'];
    sgst = json['sgst'];
    packageSize = json['packageSize'];
    metric = json['metric'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['quantity'] = quantity;
    data['productId'] = productId;
    data['item_mrp'] = itemMrp;
    data['product_quantity'] = productQuantity;
    data['productName'] = productName;
    data['isCancelled'] = isCancelled;
    data['isDamaged'] = isDamaged;
    data['cgst'] = cgst;
    data['igst'] = igst;
    data['sgst'] = sgst;
    data['packageSize'] = packageSize;
    data['metric'] = metric;
    data['images'] = images;
    return data;
  }
}

class Address {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postalCode;
  dynamic latitude;
  dynamic longitude;
  bool? status;

  Address(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postalCode,
      this.latitude,
      this.longitude,
      this.status});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    data['address1'] = address1;
    data['address2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['postalCode'] = postalCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['status'] = status;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? company;
  String? email;
  String? mobileNumber;
  String? countryCode;
  String? password;
  dynamic photo;
  String? otp;
  bool? isDocumentsVerified;
  bool? status;
  bool? allNotification;
  bool? notificationOne;
  bool? notificationTwo;
  String? fcmToken;
  dynamic gstNumber;
  String? createdAt;
  String? updatedAt;
  bool? hasExported;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.company,
      this.email,
      this.mobileNumber,
      this.countryCode,
      this.password,
      this.photo,
      this.otp,
      this.isDocumentsVerified,
      this.status,
      this.allNotification,
      this.notificationOne,
      this.notificationTwo,
      this.fcmToken,
      this.gstNumber,
      this.createdAt,
      this.updatedAt,
      this.hasExported});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    company = json['company'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    countryCode = json['countryCode'];
    password = json['password'];
    photo = json['photo'];
    otp = json['otp'];
    isDocumentsVerified = json['isDocumentsVerified'];
    status = json['status'];
    allNotification = json['allNotification'];
    notificationOne = json['notificationOne'];
    notificationTwo = json['notificationTwo'];
    fcmToken = json['fcmToken'];
    gstNumber = json['gstNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    hasExported = json['hasExported'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['company'] = company;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['countryCode'] = countryCode;
    data['password'] = password;
    data['photo'] = photo;
    data['otp'] = otp;
    data['isDocumentsVerified'] = isDocumentsVerified;
    data['status'] = status;
    data['allNotification'] = allNotification;
    data['notificationOne'] = notificationOne;
    data['notificationTwo'] = notificationTwo;
    data['fcmToken'] = fcmToken;
    data['gstNumber'] = gstNumber;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['hasExported'] = hasExported;
    return data;
  }
}

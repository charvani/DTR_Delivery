class OrderDetailsResponseModel {
  Order? order;
  List<OrderDetails>? orderDetails;
  Address? address;
  User? user;

  OrderDetailsResponseModel(
      {this.order, this.orderDetails, this.address, this.user});

  OrderDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetails>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.orderDetails != null) {
      data['orderDetails'] = this.orderDetails!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
  double? total;
  Null? razorpayOrderId;
  Null? expectedDeliveryDate;
  String? paymentMode;
  Null? paymentStatus;
  String? expiresAt;
  bool? isPaymentCompleted;
  Null? paidAmount;
  int? checkoutDiscount;
  Null? paymentGatewayStatus;
  bool? hasFetchedPaymentData;
  bool? paidInFull;
  Null? refundedAmount;
  Null? paymentReferenceNumber;
  Null? paymentReferenceUrl;
  bool? hasCancels;
  Null? cancellationAmount;
  String? status;
  bool? hasProcessedByPincode;
  bool? cannotAssign;
  Null? reason;
  bool? deliveryByThirdParty;
  Null? tripOrderId;
  Null? providerId;

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
      this.providerId});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    data['addressId'] = this.addressId;
    data['total'] = this.total;
    data['razorpayOrderId'] = this.razorpayOrderId;
    data['expectedDeliveryDate'] = this.expectedDeliveryDate;
    data['paymentMode'] = this.paymentMode;
    data['paymentStatus'] = this.paymentStatus;
    data['expiresAt'] = this.expiresAt;
    data['isPaymentCompleted'] = this.isPaymentCompleted;
    data['paidAmount'] = this.paidAmount;
    data['checkoutDiscount'] = this.checkoutDiscount;
    data['paymentGatewayStatus'] = this.paymentGatewayStatus;
    data['hasFetchedPaymentData'] = this.hasFetchedPaymentData;
    data['paidInFull'] = this.paidInFull;
    data['refundedAmount'] = this.refundedAmount;
    data['paymentReferenceNumber'] = this.paymentReferenceNumber;
    data['paymentReferenceUrl'] = this.paymentReferenceUrl;
    data['hasCancels'] = this.hasCancels;
    data['cancellationAmount'] = this.cancellationAmount;
    data['status'] = this.status;
    data['hasProcessedByPincode'] = this.hasProcessedByPincode;
    data['cannotAssign'] = this.cannotAssign;
    data['reason'] = this.reason;
    data['deliveryByThirdParty'] = this.deliveryByThirdParty;
    data['tripOrderId'] = this.tripOrderId;
    data['providerId'] = this.providerId;
    return data;
  }
}

class OrderDetails {
  int? price;
  int? quantity;
  int? productId;
  int? itemMrp;
  int? productQuantity;
  String? productName;
  bool? isCancelled;
  bool? isDamaged;
  String? cgst;
  String? igst;
  String? sgst;
  String? packageSize;
  String? metric;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['productId'] = this.productId;
    data['item_mrp'] = this.itemMrp;
    data['product_quantity'] = this.productQuantity;
    data['productName'] = this.productName;
    data['isCancelled'] = this.isCancelled;
    data['isDamaged'] = this.isDamaged;
    data['cgst'] = this.cgst;
    data['igst'] = this.igst;
    data['sgst'] = this.sgst;
    data['packageSize'] = this.packageSize;
    data['metric'] = this.metric;
    data['images'] = this.images;
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
  Null? latitude;
  Null? longitude;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postalCode'] = this.postalCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
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
  Null? photo;
  String? otp;
  bool? isDocumentsVerified;
  bool? status;
  bool? allNotification;
  bool? notificationOne;
  bool? notificationTwo;
  String? fcmToken;
  Null? gstNumber;
  String? createdAt;
  String? updatedAt;

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
      this.updatedAt});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['company'] = this.company;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['countryCode'] = this.countryCode;
    data['password'] = this.password;
    data['photo'] = this.photo;
    data['otp'] = this.otp;
    data['isDocumentsVerified'] = this.isDocumentsVerified;
    data['status'] = this.status;
    data['allNotification'] = this.allNotification;
    data['notificationOne'] = this.notificationOne;
    data['notificationTwo'] = this.notificationTwo;
    data['fcmToken'] = this.fcmToken;
    data['gstNumber'] = this.gstNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

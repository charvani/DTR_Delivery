class AssignedOrdersResponseModel {
  String? id;
  dynamic orderValue;
  String? customerName;
  String? customerMobileNumber;
  OrderAddress? orderAddress;
  String? orderDate;
  String? orderStatus;
  String? orderPaymentMode;
  dynamic isInspectionStarted;
  List<OrderDetails>? orderDetails;

  AssignedOrdersResponseModel(
      {this.id,
      this.orderValue,
      this.customerName,
      this.customerMobileNumber,
      this.orderAddress,
      this.orderDate,
      this.orderStatus,
      this.orderPaymentMode,
      this.isInspectionStarted,
      this.orderDetails});

  AssignedOrdersResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderValue = json['orderValue'];
    customerName = json['customerName'];
    customerMobileNumber = json['customerMobileNumber'];
    orderAddress = json['orderAddress'] != null
        ? OrderAddress.fromJson(json['orderAddress'])
        : null;
    orderDate = json['orderDate'];
    orderStatus = json['orderStatus'];
    orderPaymentMode = json['orderPaymentMode'];
    isInspectionStarted = json['isInspectionStarted'];
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetails>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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

class OrderDetails {
  dynamic price;
  int? quantity;
  int? productId;
  dynamic itemMrp;
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

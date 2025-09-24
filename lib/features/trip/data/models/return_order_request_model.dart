class ReturnOrderRequestModel {
  bool? isDamaged;
  String? reason;
  String? orderId;

  ReturnOrderRequestModel({this.isDamaged, this.reason, this.orderId});

  ReturnOrderRequestModel.fromJson(Map<String, dynamic> json) {
    isDamaged = json['isDamaged'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDamaged'] = this.isDamaged;
    data['reason'] = this.reason;
    return data;
  }
}

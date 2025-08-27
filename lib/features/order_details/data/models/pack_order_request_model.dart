class PackOrderRequestModel {
  String? orderId;
  bool? isInspectionStart;

  PackOrderRequestModel({this.orderId, this.isInspectionStart});

  PackOrderRequestModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    isInspectionStart = json['isInspectionStart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['isInspectionStart'] = this.isInspectionStart;
    return data;
  }
}

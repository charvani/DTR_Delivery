class CompleteDeliveryRequestModel {
  String? tripOrderId;
  String? otp;

  CompleteDeliveryRequestModel({this.tripOrderId, this.otp});

  CompleteDeliveryRequestModel.fromJson(Map<String, dynamic> json) {
    tripOrderId = json['tripOrderId'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tripOrderId'] = this.tripOrderId;
    data['otp'] = this.otp;
    return data;
  }
}

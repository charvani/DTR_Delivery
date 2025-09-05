class ReachedLocationRequestModel {
  String? tripOrderId;

  ReachedLocationRequestModel({this.tripOrderId});

  ReachedLocationRequestModel.fromJson(Map<String, dynamic> json) {
    tripOrderId = json['tripOrderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tripOrderId'] = this.tripOrderId;
    return data;
  }
}

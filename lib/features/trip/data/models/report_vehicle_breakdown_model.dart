class ReportVehicleBreakdownRequestModel {
  String? cancelledReason;
  String? tripId;

  ReportVehicleBreakdownRequestModel({this.cancelledReason, this.tripId});

  ReportVehicleBreakdownRequestModel.fromJson(Map<String, dynamic> json) {
    cancelledReason = json['cancelledReason'];
    tripId = json['tripId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cancelledReason'] = cancelledReason;
    data['tripId'] = tripId;
    return data;
  }
}

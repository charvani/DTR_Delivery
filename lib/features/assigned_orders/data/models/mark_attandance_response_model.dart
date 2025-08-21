class MarkAttandanceResponseModel {
  String? message;
  String? punchInTime;
  String? punchOutTime;
  String? date;

  MarkAttandanceResponseModel(
      {this.message, this.punchInTime, this.punchOutTime, this.date});

  MarkAttandanceResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    punchInTime = json['punchInTime'];
    punchOutTime = json['punchOutTime'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['punchInTime'] = punchInTime;
    data['punchOutTime'] = punchOutTime;
    data['date'] = date;
    return data;
  }
}

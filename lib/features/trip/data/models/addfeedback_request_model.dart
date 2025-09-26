class AddFeedbackRequestModel {
  int? providerId;
  String? tripOrderId;
  dynamic rating;
  dynamic feedback;

  AddFeedbackRequestModel(
      {this.providerId, this.tripOrderId, this.rating, this.feedback});

  AddFeedbackRequestModel.fromJson(Map<String, dynamic> json) {
    providerId = json['providerId'];
    tripOrderId = json['tripOrderId'];
    rating = json['rating'];
    feedback = json['feedback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['providerId'] = providerId;
    data['tripOrderId'] = tripOrderId;
    data['rating'] = rating;
    data['feedback'] = feedback;
    return data;
  }
}

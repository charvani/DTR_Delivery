class AddfeedbackRequestEntity {
  int? providerId;
  String? tripOrderId;
  Null rating;
  Null feedback;

  AddfeedbackRequestEntity(
      {this.providerId, this.tripOrderId, this.rating, this.feedback});
}

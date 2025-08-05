class CustomHttpException implements Exception {
  String? data;
  int? statusCode;

  CustomHttpException(this.data, this.statusCode);
}

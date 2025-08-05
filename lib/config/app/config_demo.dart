import 'app_config.dart';

class ConfigDemo implements AppConfig {
  @override
  String get url =>
      // "https://app-staging.viswahita.com";
      "http://147.93.105.82:3003";

  @override
  String get baseUrl => "$url/api/v1";
}

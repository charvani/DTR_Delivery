import 'app_config.dart';

class ConfigProd implements AppConfig {
  @override
  String get url => "http://147.93.105.82:8003";

  @override
  String get baseUrl => "$url/api/v1";
}

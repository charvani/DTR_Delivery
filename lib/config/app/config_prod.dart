import 'app_config.dart';

class ConfigProd implements AppConfig {
  @override
  String get url => "";
  @override
  String get baseUrl => "$url/api/v1";
}

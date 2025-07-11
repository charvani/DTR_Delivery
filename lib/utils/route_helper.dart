import 'dart:async';

import '../routes/routes.dart';

Future<String> getInitialRoute() async {
  String route = Routes.getLoginRoute();
  return route;
}

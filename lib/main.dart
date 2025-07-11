import 'package:dtr_delivery/routes/routes.dart';
import 'package:dtr_delivery/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/route_helper.dart';

void main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'DTR Delivery App',
    theme: ThemeDataForApp.lightTheme,
    initialRoute: await getInitialRoute(),
    getPages: Routes.routes,
    // home: LoginScreen(),
  ));
}

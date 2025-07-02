import 'package:dtr_delivery/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/login/presentation/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DTR Delivery App',
      theme: ThemeDataForApp.lightTheme,
      home: LoginScreen(),
    );
  }
}

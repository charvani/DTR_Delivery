import 'package:dtr_delivery/routes/routes.dart';
import 'package:dtr_delivery/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'config/flavour.dart';
import 'config/injector.dart';
import 'features/bottom_bar/presentation/pages/bottombar_screen.dart';
import 'features/log_in/presentation/pages/login_screen.dart';

var getStore = getIt.get<GetStorage>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  print("char..kDebugMode");
  Flavour.appFlavour = FlavorEnum.demo;
  await init(FlavorEnum.demo);

  runApp(ScreenUtilInit(
    designSize: const Size(430, 896),
    minTextAdapt: true,
    ensureScreenSize: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DTR Delivery App',
        theme: ThemeDataForApp.lightTheme,
        // initialRoute:  getInitialRoute(),
        getPages: Routes.routes,
        home:  getStore.read("accessToken") != null
            ? BottomBarWidgetPage()
            : LoginScreen(),
      );
    },
  ));
}



// GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'DTR Delivery App',
//       theme: ThemeDataForApp.lightTheme,
//       initialRoute: await getInitialRoute(),
//       getPages: Routes.routes,
//       // home: LoginScreen(),
//         ),
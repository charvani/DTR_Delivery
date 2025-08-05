import 'package:dtr_delivery/features/assigned_orders/presentation/pages/assigned_orders_screen.dart';
import 'package:dtr_delivery/features/bottom_bar/presentation/pages/bottombar_screen.dart';
import 'package:dtr_delivery/features/trips_screen.dart';
import 'package:dtr_delivery/features/unassigned_orders_screen.dart';
import 'package:dtr_delivery/features/user_account_screen.dart';
import 'package:get/get.dart';

import '../features/log_in/presentation/pages/login_screen.dart';

class Routes {
  static String loginScreen = "/login_screen";
  static String bottomBarScreen = "/bottombar_screen";
  static String assinedOrdersScreen = "/assinedOrders_screen";
  static String unAssinedOrdersScreen = "/unAssinedOrders_screen";
  static String tripsScreen = "/trips_screen";
  static String userAccountsScreen = "/userAccount_screen";

  static String getLoginRoute() => loginScreen;
  static String getBottomBarRoute() => bottomBarScreen;
  static String getAssignedOrderRoute() => assinedOrdersScreen;
  static String getUnAssignedOrderRoute() => unAssinedOrdersScreen;
  static String getTripRoute() => tripsScreen;
  static String getUserAccountRoute() => userAccountsScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: bottomBarScreen, page: () => BottomBarWidgetPage()),
    GetPage(name: assinedOrdersScreen, page: () => AssignedOrdersScreen()),
    GetPage(name: unAssinedOrdersScreen, page: () => UnassignedOrdersScreen()),
    GetPage(name: tripsScreen, page: () => TripsScreen()),
    GetPage(name: userAccountsScreen, page: () => UserAccountScreen()),
  ];
}

import 'package:dtr_delivery/features/assigned_orders/presentation/pages/assigned_orders_screen.dart';
import 'package:dtr_delivery/features/trips_screen.dart';
import 'package:dtr_delivery/features/unassigned_orders_screen.dart';
import 'package:dtr_delivery/features/user_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_opacity/with_opacity.dart';

import '../../../../utils/common_colors.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:medblooms_pharmacy/utils/theme.dart';

class BottomBarWidgetPage extends StatefulWidget {
  const BottomBarWidgetPage({
    super.key,
  });

  @override
  State<BottomBarWidgetPage> createState() => _BottomBarWidgetPageState();
}

class _BottomBarWidgetPageState extends State<BottomBarWidgetPage> {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    AssignedOrdersScreen(),
    UnassignedOrdersScreen(),
    TripsScreen(),
    UserAccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(child: _widgetOptions.elementAt(selectedIndex)),
        bottomNavigationBar: SizedBox(
          // height: 62,
          child: BottomNavigationBar(
            useLegacyColorScheme: false,
            backgroundColor: WHITE_COLOR,
            selectedFontSize: 14.sp,
            unselectedFontSize: 14.sp,
            showUnselectedLabels: true,
            elevation: 0.0,
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.5.h),
                  child: Image.asset(
                    "assets/images/assigned_order.png",
                    height: 20,
                    color: MEDIUM_BLACKTEXT_COLOR,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2.5.h),
                  child: Image.asset(
                    "assets/images/assigned_order.png",
                    height: 20,
                    // color: REDAPPTHEME_COLOR,
                  ),
                ),
                label: "Assigned\n   Orders",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.5.h),
                  child: Image.asset(
                    "assets/images/unassigned_order.png",
                    height: 20,
                    color: MEDIUM_BLACKTEXT_COLOR,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2.5.h),
                  child: Image.asset(
                    "assets/images/unassigned_order.png",

                    height: 20,
                    color: APPTHEME_COLOR,
                    // color: REDAPPTHEME_COLOR,
                  ),
                ),
                label: "Unassigned\n     Orders",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.5.h),
                  child: Image.asset(
                    "assets/images/trip.png",
                    height: 20,
                    color: MEDIUM_BLACKTEXT_COLOR,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2.5.h),
                  child: Image.asset(
                    "assets/images/trip.png",
                    height: 20,
                    // color: REDAPPTHEME_COLOR,
                  ),
                ),
                label: "Trips\n",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2.5.h),
                  child: Image.asset(
                    "assets/images/user_account.png",
                    height: 20,
                    color: MEDIUM_BLACKTEXT_COLOR,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2.5.h),
                  child: Image.asset(
                    "assets/images/user_account.png",
                    height: 20,
                    // color: REDAPPTHEME_COLOR,
                  ),
                ),
                label: "Account\n",
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: APPTHEME_COLOR,
            unselectedItemColor: MEDIUM_BLACKTEXT_COLOR,
            selectedLabelStyle:
                TextStyle(color: APPTHEME_COLOR, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(
                color: MEDIUM_BLACKTEXT_COLOR.withCustomOpacity(0.4),
                fontWeight: FontWeight.w600),
            onTap: (int index) {
              if (mounted) {
                setState(() {
                  selectedIndex = index;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  var currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      // Fluttertoast.showToast(msg: "Tap back again to leave");
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }
}

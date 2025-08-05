import 'package:dtr_delivery/features/order_details_screen.dart';
import 'package:dtr_delivery/utils/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/order_widget.dart';
import '../../../../utils/square_action_button.dart';
import '../widgets/assigned_orders_widgets.dart';

class AssignedOrdersScreen extends StatefulWidget {
  const AssignedOrdersScreen({super.key});

  @override
  State<AssignedOrdersScreen> createState() => _AssignedOrdersScreenState();
}

class _AssignedOrdersScreenState extends State<AssignedOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
            title: "Assigned Orders",
            backNavigation: false,
            actions: [],
            centerTitle: true),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: SquareActionButton(
            buttonTitle: "Initiate Trip",
            onTapFun: () {
              Get.focusScope?.unfocus();
              // if (_formKey.currentState!.validate()) {
              // controller.getSignIn();
              // Get.to(() => BottomBarWidgetPage());
              // }
              // controller.update();
            },
          ),
        ),
        body: Column(
          children: [
            MarkAttendanceWidget(
              title: "Mark Attendance",
              initialVal: false,
              controller: ValueNotifier<bool>(false),
              onChangedFun: (value) {},
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return OrderWidget(
                      onTapFun: () {
                        Get.to(() => OrderDetailsScreen());
                      },
                      customerMobileNumber: "1234567895",
                      customerName: "chrvan",
                      order: "14rwe44r",
                      location: "sfsfsf",
                    );
                  }),
            ),
          ],
        ));
  }
}

import 'package:dtr_delivery/features/order_details_screen.dart';
import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';

import '../utils/space_widget.dart';
import '../utils/square_action_button.dart';

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
          padding: const EdgeInsets.all(8.0),
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
                    return ListTile(
                      onTap: () {
                        Get.to(() => OrderDetailsScreen());
                      },
                      leading: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: LIGHT_BLACK_SHADE_COLOR),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/images/order_box.png",
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer: Charvani",
                            style: Get.textTheme.titleSmall!
                                .copyWith(color: BLACK_TEXT_COLOR2),
                          ),
                          Text(
                            "Order: #123",
                            style: Get.textTheme.labelSmall,
                          ),
                          // Text(
                          //   "Invoice: #1234",
                          //   style: Get.textTheme.labelSmall,
                          // ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.call,
                              size: 20,
                            ),
                            SpaceWidget(
                              width: 5,
                            ),
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: GREEN_COLOR,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

class MarkAttendanceWidget extends StatelessWidget {
  final String title;
  final ValueChanged<dynamic>? onChangedFun;
  final ValueNotifier<bool>? controller;
  final bool initialVal;
  const MarkAttendanceWidget(
      {super.key,
      required this.title,
      required this.controller,
      required this.onChangedFun,
      required this.initialVal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 20,
      // horizontalTitleGap: 20,
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      // leading: Image.asset(image, height: 20),
      trailing: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: AdvancedSwitch(
          initialValue: initialVal,
          controller: controller,
          onChanged: onChangedFun,
          inactiveColor: Color(0xFFDCDCE0),
          activeColor: GREEN_COLOR,
          width: 52,
          height: 24,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: APPTHEME_COLOR, fontFamily: "Medium", fontSize: 14),
      ),
    );
  }
}

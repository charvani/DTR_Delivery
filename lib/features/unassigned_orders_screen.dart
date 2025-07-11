import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/space_widget.dart';
import 'unassigned_order_details_screen.dart';

class UnassignedOrdersScreen extends StatefulWidget {
  const UnassignedOrdersScreen({super.key});

  @override
  State<UnassignedOrdersScreen> createState() => _UnassignedOrdersScreenState();
}

class _UnassignedOrdersScreenState extends State<UnassignedOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
            title: "Unassigned Orders",
            backNavigation: false,
            actions: [],
            centerTitle: true),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () {
                  Get.to(() => UnassignedOrderDetailsScreen());
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
                    Text("Customer: Charvani", style: Get.textTheme.titleSmall),
                    Text(
                      "Order: #123",
                      style: Get.textTheme.labelSmall,
                    ),
                    Text(
                      "Invoice: #1234",
                      style: Get.textTheme.labelSmall,
                    ),
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
            }));
  }
}

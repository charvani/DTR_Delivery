import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'trip_details_screen.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
          title: "Trips",
          backNavigation: false,
          actions: [],
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () {
                  Get.to(() => TripDetailsScreen());
                },
                leading: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: LIGHT_BLACK_SHADE_COLOR),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(
                      "assets/images/trip2.png",
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vehicle Name: Bike",
                      style: Get.textTheme.titleSmall!
                          .copyWith(color: BLACK_TEXT_COLOR2),
                    ),
                    Text(
                      "Trip Id: #123",
                      style: Get.textTheme.labelSmall,
                    ),
                    Text(
                      "Orders Count: 10",
                      style: Get.textTheme.labelSmall,
                    ),
                    Text(
                      "Delivered Count: 3",
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
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: LIGHT_LINE_COLOR,
                        // color: GREEN_COLOR,
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}

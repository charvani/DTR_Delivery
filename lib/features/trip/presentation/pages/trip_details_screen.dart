import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/square_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../order_details/presentation/pages/order_details_screen.dart';

class TripDetailsScreen extends StatefulWidget {
  final String type;
  const TripDetailsScreen({super.key, required this.type});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  bool isChecked = true;
  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            centerTitle: true,
            title: const Text("Trip Details"),
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.keyboard_backspace_rounded)),
            backgroundColor: WHITE_COLOR,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("TRIP ID: #123456",
                          style: Get.textTheme.titleMedium),
                      (widget.type == "delivered")
                          ? Image.asset(
                              "assets/images/delivered.png",
                              height: 35,
                            )
                          : Image.asset(
                              "assets/images/cancelled_tag.png",
                              height: 40,
                            )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text("Vehicle Details:", style: Get.textTheme.titleMedium),
                  const SizedBox(height: 5),
                  _containerCard(
                    children: [
                      _tripDetailsRow("Vehicle Name", "Bike"),
                      _tripDetailsRow("Vehicle Number", "AP12345"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("Order Details:", style: Get.textTheme.titleMedium),
                  const SizedBox(height: 5),
                  _containerCard(
                    children: [
                      _tripDetailsRow("Orders Count", "10"),
                      _tripDetailsRow("Delivered Count", "3"),
                      _buildInvoiceRow("Order Total", "10000"),
                      _buildInvoiceRow("Amount Collected", "10000"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Orders:", style: Get.textTheme.titleMedium),
              ],
            ),
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 3,
              (context, i) => ListTile(
                onTap: () => Get.to(() => OrderDetailsScreen(
                      orderId: "",
                      fromScreen: "trips",
                    )),
                leading: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: LIGHT_BLACK_SHADE_COLOR,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/images/order_box.png"),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customer: Charvani",
                        style: Get.textTheme.titleSmall!
                            .copyWith(color: BLACK_TEXT_COLOR2)),
                    Text("Order: #123", style: Get.textTheme.labelSmall),
                    // Text("Invoice: #1234", style: Get.textTheme.labelSmall),
                  ],
                ),
                trailing: SizedBox(
                  width: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.call, size: 20),
                      const SizedBox(width: 5),
                      Icon(Icons.location_on, size: 20, color: GREEN_COLOR),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             const Text(
                  //               "Delivery orders were followed as assigned",
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.w500, fontSize: 12),
                  //             ),
                  //             InkWell(
                  //               onTap: () => setState(() => isChecked = !isChecked),
                  //               child: Container(
                  //                 width: 24,
                  //                 height: 24,
                  //                 decoration: BoxDecoration(
                  //                   color: !isChecked ? Colors.red[100] : GREEN_COLOR,
                  //                 ),
                  //                 child: Center(
                  //                   child: !isChecked
                  //                       ? Icon(Icons.close,
                  //                           size: 18, color: INDICATION_COLOR)
                  //                       : Icon(Icons.done,
                  //                           color: WHITE_COLOR, size: 18),
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  // if (!isChecked) ...[
                  //   const SizedBox(height: 10),
                  //   Text(
                  //     "Deviation Reason*",
                  //     style: Theme.of(context).textTheme.titleSmall,
                  //   ),
                  //   const SizedBox(height: 8),
                  //   Multilinetextfield(
                  //     textEditingController: reasonController,
                  //     maxlines: 5,
                  //     hintText:
                  //         "Enter the reason for order sequence not followed",
                  //     keyboardType: TextInputType.name,
                  //     validationFun: (String? value) {
                  //       if (value!.isEmpty) {
                  //         return "Please enter reason";
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  //   const SizedBox(height: 8),
                  //   SquareActionButton(
                  //     buttonTitle: "Submit",
                  //     onTapFun: () {
                  //       // Save or handle reason
                  //     },
                  //   ),
                  // ],
                  const SizedBox(height: 20),
                  SquareActionButton(
                    buttonTitle: "Trip Route",
                    onTapFun: () async {
                      final String origin =
                          "Vizag Railway Station, Visakhapatnam";
                      final String waypoint1 = "Kailasagiri, Visakhapatnam";
                      final String destination = "RK Beach, Visakhapatnam";

                      final String googleMapsUrl =
                          "https://www.google.com/maps/dir/?api=1"
                          "&origin=${Uri.encodeComponent(origin)}"
                          "&destination=${Uri.encodeComponent(destination)}"
                          "&waypoints=${Uri.encodeComponent(waypoint1)}";

                      if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
                        await launchUrl(Uri.parse(googleMapsUrl),
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch Google Maps';
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _containerCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: LIGHT_BLACK_SHADE_COLOR,
      ),
      child: Column(children: children),
    );
  }

  Widget _tripDetailsRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Get.textTheme.titleSmall),
          Text(value, style: Get.textTheme.titleSmall),
        ],
      ),
    );
  }

  Widget _buildInvoiceRow(String item, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item, style: Get.textTheme.titleSmall),
          RichText(
            text: TextSpan(
              text: "₹",
              style: TextStyle(color: BLACK_TEXT_COLOR),
              children: [
                TextSpan(text: price, style: Get.textTheme.titleSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

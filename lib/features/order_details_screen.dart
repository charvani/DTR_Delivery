import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/custom_action_button.dart';
import '../utils/square_action_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          title: 'Order Details',
          backNavigation: true,
          actions: [],
          centerTitle: true),
      // appBar: AppBar(
      //   title: const Text('Order Details'),
      //   leading: const BackButton(),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order ID: #123456", style: Get.textTheme.titleLarge),
            const SizedBox(height: 12),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: LIGHT_BLACK_SHADE_COLOR,
                  child: Icon(
                    Icons.person_2_outlined,
                    color: BLACK_COLOR,
                  ),
                  // Replace with actual image asset
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Customer: Sarah Miller",
                          style: Get.textTheme.titleMedium),
                      Text("456 Elm Street, Anytown",
                          style: Get.textTheme.labelSmall),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: LIGHT_BLACK_SHADE_COLOR),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.call_outlined),
                  ),
                ),
                SpaceWidget(
                  width: 10,
                ),
                Text("Contact: +91 8123456789",
                    style: Get.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 20),
            Text("Invoice Details", style: Get.textTheme.titleLarge),
            const SizedBox(height: 10),
            _buildInvoiceHeadingRow(),
            const SizedBox(height: 10),
            _buildInvoiceRow("Ventilator", 150, "5000"),
            _buildInvoiceRow("Dolo Tablets", 100, "2500"),
            _buildInvoiceRow("Tissues", 50, "200"),
            const Divider(
              height: 30,
              color: LIGHT_BLACK_SHADE_COLOR,
            ),
            _buildSummaryRow("Total Amount", "7500"),
            // _buildSummaryRow("Discount (40%)", "3000"),
            _discountTotalRow("3000"),
            _buildSummaryRow("Total Before Tax", "4166.67"),
            _buildSummaryRow("Delivery Charges", "Free"),
            const SizedBox(height: 10),
            _orderTotalRow("4500"),
            const SizedBox(height: 20),

            // Text("Notes", style: Get.textTheme.titleLarge),
            // const SizedBox(height: 5),
            // Text(
            //   "Leave at the front door. Ring the doorbell twice.",
            //   style: Get.textTheme.labelSmall,
            // ),

            const SizedBox(height: 20),
            SquareActionButton(
              buttonTitle: "Order Picked Up",
              onTapFun: () {
                // if (_formKey.currentState!.validate()) {
                // controller.getSignIn();
                // }
                // controller.update();
              },
            ),
            const SizedBox(height: 10),
            CustomActionButton(
              buttonTitle: "Call Customer",
              onTapFun: () {},
              titleColor: APPTHEME_COLOR,
              backgroundColor: BUTTON_BG_COLOR,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceHeadingRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
              flex: 2, child: Text("Item", style: Get.textTheme.titleMedium)),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("qty", style: Get.textTheme.titleMedium),
                  Text("Price", style: Get.textTheme.titleMedium),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildInvoiceRow(String item, int qty, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(item, style: const TextStyle(color: Colors.grey))),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(qty.toString(),
                    style: const TextStyle(color: Colors.grey)),
                RichText(
                    text: TextSpan(
                        text: "₹",
                        style: TextStyle(color: BLACK_TEXT_COLOR),
                        children: [
                      TextSpan(text: price, style: Get.textTheme.titleSmall)
                    ])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String amount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Get.textTheme.titleMedium),
          RichText(
              text: TextSpan(
                  text: label.contains("Delivery") ? "" : "₹",
                  style: TextStyle(color: BLACK_TEXT_COLOR),
                  children: [
                TextSpan(text: amount, style: Get.textTheme.titleSmall)
              ])),
        ],
      ),
    );
  }

  Widget _orderTotalRow(
    String amount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Order Total", style: Get.textTheme.headlineMedium),
          RichText(
              text: TextSpan(
                  text: "₹",
                  style: TextStyle(color: BLACK_TEXT_COLOR, fontSize: 16),
                  children: [
                TextSpan(text: amount, style: Get.textTheme.headlineMedium)
              ])),
        ],
      ),
    );
  }

  Widget _discountTotalRow(
    String amount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Discount (40%)", style: Get.textTheme.titleMedium),
          RichText(
              text: TextSpan(
                  text: "- ₹",
                  style: TextStyle(color: INDICATION_COLOR, fontSize: 16),
                  children: [
                TextSpan(
                    text: amount,
                    style: Get.textTheme.titleMedium!
                        .copyWith(color: INDICATION_COLOR))
              ])),
        ],
      ),
    );
  }
}

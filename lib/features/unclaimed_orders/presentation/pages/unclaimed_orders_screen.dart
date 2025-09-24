import 'package:dtr_delivery/features/unclaimed_orders/presentation/manager/unclaimed_orders_controller.dart';
import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../utils/common_colors.dart';
import '../../../../utils/order_widget.dart';
import '../../../../utils/snack_bar.dart';
import '../../../order_details/presentation/pages/order_details_screen.dart';

class UnclaimedOrdersScreen extends StatefulWidget {
  const UnclaimedOrdersScreen({super.key});

  @override
  State<UnclaimedOrdersScreen> createState() => _UnclaimedOrdersScreenState();
}

class _UnclaimedOrdersScreenState extends State<UnclaimedOrdersScreen> {
  final UnclaimedOrdersController controller =
      Get.put(UnclaimedOrdersController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      dynamic val = await getStore.read(
        "punch",
      );
      print("punn....$val");
      controller.punch = val;
      controller.update();
      if (val == "notpunched") {
        SnackBarUtil.errorSnackBar("Please punch in");
      } else {
        controller.getUnclaimedOrdersController();
        getUncalimedOrdersScrollListener();
      }
    });
  }

  getUncalimedOrdersScrollListener() {
    print("at listnerqqqqq");

    controller.unclaimedOrdersListScrollController.addListener(() {
      print("at listner");
      if (controller.unclaimedOrdersListScrollController.position.pixels ==
          controller
              .unclaimedOrdersListScrollController.position.maxScrollExtent) {
        print("at listner 333333");

        controller.getUnclaimedOrdersController();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
            title: "Unclaimed Orders",
            backNavigation: false,
            actions: [],
            centerTitle: true),
        body: GetBuilder<UnclaimedOrdersController>(builder: (context) {
          return controller.loading.value
              ? LoaderWidget()
              : controller.punch == "notpunched"
                  ? Center(
                      child: Text("Please punch In",
                          style: Get.textTheme.titleSmall!
                              .copyWith(color: INDICATION_COLOR)),
                    )
                  : controller.unclaimedOrdersList.isEmpty
                      ? Center(
                          child: Text("Unclaimed Orders not available",
                              style: Get.textTheme.titleSmall),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  controller: controller
                                      .unclaimedOrdersListScrollController,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount:
                                      controller.unclaimedOrdersList.length,
                                  itemBuilder: (context, i) {
                                    return OrderWidget(
                                      statusOfOrder: "",
                                      onTapFun: () async {
                                        dynamic val = await getStore.read(
                                          "punch",
                                        );
                                        print("punn....$val");
                                        if (val == "notpunched") {
                                          SnackBarUtil.errorSnackBar(
                                              "Please punch in");
                                        } else {
                                          Get.to(() => OrderDetailsScreen(
                                                orderId: controller
                                                    .unclaimedOrdersList[i]
                                                    .orderId!,
                                                fromScreen: "unclaimed_orders",
                                              ));
                                        }
                                      },
                                      customerMobileNumber: controller
                                              .unclaimedOrdersList[i]
                                              .customerMobileNumber ??
                                          "",
                                      customerName: controller
                                              .unclaimedOrdersList[i]
                                              .customerName ??
                                          "",
                                      order: controller
                                              .unclaimedOrdersList[i].orderId ??
                                          "",
                                      latitude: controller
                                          .unclaimedOrdersList[i]
                                          .orderAddress!
                                          .latitude,
                                      longitude: controller
                                          .unclaimedOrdersList[i]
                                          .orderAddress!
                                          .longitude,
                                      location:
                                          "${controller.unclaimedOrdersList[i].orderAddress!.address1},${controller.unclaimedOrdersList[i].orderAddress!.address2},${controller.unclaimedOrdersList[i].orderAddress!.city},${controller.unclaimedOrdersList[i].orderAddress!.state},${controller.unclaimedOrdersList[i].orderAddress!.postalCode}",
                                    
                                    );
                                  }),
                            ),
                            controller.paginationLoading.value
                                ? LoaderWidget()
                                : SizedBox.shrink()
                          ],
                        );
        }));
  }
}

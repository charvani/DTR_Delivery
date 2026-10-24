import 'package:dtr_delivery/features/order_details/presentation/pages/order_details_screen.dart';
import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/loader.dart';
import 'package:dtr_delivery/utils/snack_bar.dart';
import 'package:dtr_delivery/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../utils/order_widget.dart';
import '../manager/assigned_orders_controller.dart';
import '../widgets/assigned_orders_widgets.dart';

class AssignedOrdersScreen extends StatefulWidget {
  const AssignedOrdersScreen({super.key});

  @override
  State<AssignedOrdersScreen> createState() => _AssignedOrdersScreenState();
}

class _AssignedOrdersScreenState extends State<AssignedOrdersScreen> {
  final AssignedOrdersController controller =
      Get.put(AssignedOrdersController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getStatusOfAttandanceController();
      controller.getAssignedOrdersController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
            title: "Assigned Orders",
            backNavigation: false,
            actions: [],
            centerTitle: true),
        // bottomNavigationBar: Obx(() {
        //   return controller.assignedOrders.isEmpty
        //       ? SizedBox.shrink()
        //       : Padding(
        //           padding: EdgeInsets.all(8.0.h),
        //           child: SquareActionButton(
        //             buttonTitle: "Initiate Trip",
        //             onTapFun: () {
        //               Get.focusScope?.unfocus();
        //               // if (_formKey.currentState!.validate()) {
        //               // controller.getSignIn();
        //               // Get.to(() => BottomBarWidgetPage());
        //               // }
        //               // controller.update();
        //             },
        //           ),
        //         );
        // }),
        body: SafeArea(
          child: GetBuilder<AssignedOrdersController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(controller.loading.value.toString()),
                // Text(controller.attandance.toString()),
                Obx(() {
                  return controller.attendanceLoading.value
                      ? LoaderWidget(
                          loaderColor: Colors.transparent,
                        )
                      : controller.showAttandanceWidget.value
                          ? MarkAttendanceWidget(
                              title: "Mark Attendance",
                              initialVal: controller.attandanceVal.value,
                              controller: controller.attandance,
                              onChangedFun: (value) async {
                                print("geting va...$value");
                                if (value == true &&
                                    controller.noFunctionClicked.value ==
                                        false) {
                                  controller.getPunchInController();
                                }

                                if (value == false &&
                                    controller.attandanceVal.value == true) {
                                  controller.noFunctionClicked.value = true;

                                  attandanceDialogFun(noFunction: () {
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      controller.attandance!.value =
                                          !controller.attandance!.value;
                                      controller.noFunctionClicked.value =
                                          false;

                                      controller.update();
                                    });
                                    Get.back();
                                  }, yesFunction: () {
                                    controller.noFunctionClicked.value = false;

                                    Get.back();
                                    controller.getPunchOutController();
                                  });
                                  controller.update();
                                }

                                // controller.noFunctionClicked.value = false;
                              },
                              loader: controller.attendanceLoading.value,
                            )
                          : Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Text(
                                "Note: You've already marked your attendance for today.",
                                style: TextStyle(
                                    color: INDICATION_COLOR,
                                    fontFamily: "Medium",
                                    fontSize: 14.sp),
                              ),
                            );
                }),
                SpaceWidget(
                  height: 10,
                ),
                controller.ordersLoading.value
                    ? SizedBox(height: 600.h, child: LoaderWidget())
                    : controller.assignedOrders.isEmpty
                        ? SizedBox(
                            height: 600.h,
                            child: Center(
                              child: Text("Assigned Orders not available",
                                  style: Get.textTheme.titleSmall),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: controller.assignedOrders.length,
                                itemBuilder: (context, i) {
                                  return OrderWidget(
                                    statusOfOrder: controller.assignedOrders[i]
                                                    .orderStatus!
                                                    .toLowerCase() ==
                                                "ordered" &&
                                            controller.assignedOrders[i]
                                                    .isInspectionStarted !=
                                                null
                                        ? "Packing Started"
                                        : controller
                                            .assignedOrders[i].orderStatus
                                            .toString()
                                            .capitalizeFirst!,
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
                                                  .assignedOrders[i].id!,
                                              fromScreen: "assigned_orders",
                                            ));
                                      }
                                    },
                                    customerMobileNumber: controller
                                            .assignedOrders[i]
                                            .customerMobileNumber ??
                                        "",
                                    customerName: controller
                                            .assignedOrders[i].customerName ??
                                        "",
                                    order:
                                        controller.assignedOrders[i].id ?? "",
                                    latitude: controller.assignedOrders[i]
                                        .orderAddress!.latitude,
                                    longitude: controller.assignedOrders[i]
                                        .orderAddress!.longitude,
                                    location:
                                        "${controller.assignedOrders[i].orderAddress!.address1},${controller.assignedOrders[i].orderAddress!.address2},${controller.assignedOrders[i].orderAddress!.city},${controller.assignedOrders[i].orderAddress!.state},${controller.assignedOrders[i].orderAddress!.postalCode}",
                                  );
                                }),
                          ),
              ],
            );
          }),
        ));
  }
}

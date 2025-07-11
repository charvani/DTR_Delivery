import 'package:dtr_delivery/features/login/presentation/pages/login_screen.dart';
import 'package:dtr_delivery/utils/appbar.dart';
import 'package:dtr_delivery/utils/common_colors.dart';
import 'package:dtr_delivery/utils/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          title: "Account",
          backNavigation: false,
          actions: [],
          // bottom: PreferredSize(
          //     preferredSize: Size(double.infinity, 2),
          //     child: Divider(
          //       color: LIGHT_BLACK_SHADE_COLOR,
          //     )),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile", style: Get.textTheme.titleLarge),
            profileWidget(
              icondata: Icons.person_outline_rounded,
              title: "Rider Name",
              info: "Charvani Boyi",
            ),
            profileWidget(
              icondata: Icons.phone_outlined,
              title: "Contact",
              info: "+91 8123456789",
            ),
            profileWidget(
              icondata: Icons.motorcycle,
              title: "Vehicle Details",
              info: "Honda Civic, 2018",
            ),
            SpaceWidget(
              height: 15,
            ),
            Text("Account", style: Get.textTheme.titleLarge),
            profileWidget(
              icondata: Icons.phone_outlined,
              title: "",
              info: "Change Password",
            ),
            profileWidget(
              icondata: Icons.logout_rounded,
              title: "",
              info: "Logout",
            ),
            SpaceWidget(
              height: 15,
            ),
            Text("Support", style: Get.textTheme.titleLarge),
            profileWidget(
              icondata: Icons.help_outline_rounded,
              title: "",
              info: "Help Center",
            ),

            // Logout Button
          ],
        ),
      ),
    );
  }

  Widget profileWidget({
    required IconData icondata,
    required String title,
    required String info,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (info == "Logout") {
          Get.offAll(() => LoginScreen());        }
      },
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: LIGHT_BLACK_SHADE_COLOR),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  icondata,
                  // Icons.person_outline_rounded
                )),
          ),
          SpaceWidget(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title != "")
                Text(
                  // "Rider Name",
                  title,
                  style: Get.textTheme.labelSmall,
                ),
              Text(
                // "Charvani Boyi",
                info,
                style: Get.textTheme.titleMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}

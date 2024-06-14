import 'dart:developer';

import 'package:done_driver_app/constraints/const_colors.dart';
import 'package:done_driver_app/home/controller/landing_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final landingScreenController = Get.find<LandingScreenController>();
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 10),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: kBlackColor,
          selectedItemColor: kPrimaryColor,
          currentIndex: landingScreenController.currentIdx.value,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icon/home icon.svg",
                    color: landingScreenController.currentIdx == 0
                        ? kPrimaryColor
                        : kBlackColor),
                label: "Home"),
            BottomNavigationBarItem(
                label: "My Orders",
                icon: SvgPicture.asset("assets/icon/Delivery.svg",
                    color: landingScreenController.currentIdx == 1
                        ? kPrimaryColor
                        : kBlackColor)),
            BottomNavigationBarItem(
              label: "Notification",
              icon: SvgPicture.asset("assets/icon/Notification.svg",
                  color: landingScreenController.currentIdx == 2
                      ? kPrimaryColor
                      : kBlackColor),
            ),
            BottomNavigationBarItem(
                label: "Profile",
                icon: SvgPicture.asset("assets/icon/Person.svg",
                    color: landingScreenController.currentIdx == 3
                        ? kPrimaryColor
                        : kBlackColor)),
          ],
          onTap: (idx) {
            landingScreenController.currentIdx.value = idx;
          },
        ),
      ),
      body: Obx(() => landingScreenController
          .screens[landingScreenController.currentIdx.value]),
    );
  }
}

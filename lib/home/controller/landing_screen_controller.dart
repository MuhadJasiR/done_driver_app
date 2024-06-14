import 'package:done_driver_app/home/view/home_screen.dart';
import 'package:done_driver_app/my_order/view/order_screen.dart';
import 'package:done_driver_app/notification/view/notification_screen.dart';
import 'package:done_driver_app/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreenController extends GetxController {
  RxInt currentIdx = 0.obs;
  RxList<Widget> screens = const [
    HomeScreen(),
    OrderScreen(),
    NotificationScreen(),
    ProfileScreen()
  ].obs;
}

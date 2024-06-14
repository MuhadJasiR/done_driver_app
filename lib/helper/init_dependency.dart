import 'package:done_driver_app/auth/controller/auth_controller.dart';
import 'package:done_driver_app/home/controller/home_controller.dart';
import 'package:done_driver_app/home/controller/landing_screen_controller.dart';
import 'package:done_driver_app/my_order/controller/order_controller.dart';
import 'package:done_driver_app/notification/controller/notification_controller.dart';
import 'package:done_driver_app/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class InitDependency extends Bindings {
  @override
  void dependencies() {
    Get.put(LandingScreenController());
    Get.put(AuthController());
    Get.put(HomeController());
    Get.put(OrderController());
    Get.put(ProfileController());
    Get.put(NotificationController());
  }
}

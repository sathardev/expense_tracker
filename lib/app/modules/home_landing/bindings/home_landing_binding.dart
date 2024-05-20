import 'package:get/get.dart';

import '../controllers/home_landing_controller.dart';

class HomeLandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLandingController>(
      () => HomeLandingController(),
    );
  }
}

import 'package:expense_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:expense_tracker/app/modules/home/views/home_view.dart';
import 'package:expense_tracker/app/modules/summary/controllers/summary_controller.dart';
import 'package:expense_tracker/app/modules/summary/views/summary_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLandingController extends GetxController {
  RxInt index = 0.obs;
  List<Widget> pages = <Widget>[HomeView(), SummaryView()];
  @override
  void onInit() {
    super.onInit();
    Get.put(HomeController());
    Get.put(SummaryController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool get isEnglish => locale == Locale('en', 'US');

  Locale? locale = Locale('en', 'US');

  void changeLanguage(Locale newLocale) {
    locale = newLocale;
    Get.updateLocale(newLocale);
  }
}

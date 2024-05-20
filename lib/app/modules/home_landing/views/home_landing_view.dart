import 'package:expense_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:expense_tracker/app/modules/summary/controllers/summary_controller.dart';
import 'package:expense_tracker/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/constants.dart';
import '../controllers/home_landing_controller.dart';

class HomeLandingView extends GetView<HomeLandingController> {
  const HomeLandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          onPressed: () async {
            var value =
                await Get.toNamed(Routes.ADD_EXPENSE, arguments: [null]);
            Get.find<HomeController>().fetchData();
          },
          child: const Icon(Iconsax.add),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
                children: List.generate(
                    2,
                    (index) => Flexible(
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                gradient: index == controller.index.value
                                    ? LinearGradient(
                                        colors: [
                                            yellowColor.withOpacity(0.1),
                                            yellowColor,
                                            yellowColor.withOpacity(0.1),
                                          ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)
                                    : null),
                          ),
                        ))),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: primaryColor,
                selectedItemColor: yellowColor,
                unselectedItemColor: const Color(0xFFA3A3C2),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: controller.index.value,
                onTap: (value) {
                  controller.index.value = value;
                  if(value == 1){
                   Get.find<SummaryController>().loadExpenses();
                  }
                },
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Iconsax.home), label: "home".tr),
                  BottomNavigationBarItem(
                      icon: const Icon(Iconsax.chart), label: "summary".tr),
                ]),
          ],
        ),
        body: controller.pages[controller.index.value],
      );
    });
  }
}

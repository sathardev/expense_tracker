import 'package:expense_tracker/app/data/constants.dart';
import 'package:expense_tracker/app/routes/app_pages.dart';
import 'package:expense_tracker/app/widgets/custom_text.dart';
import 'package:expense_tracker/app/widgets/skelton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../home_landing/controllers/home_landing_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          // backgroundColor: darkColor,
          title: CustomText(
            text: "app_name".tr,
            size: 20,
            weight: FontWeight.w800,
            // color: whiteColor,
          ),
          actions: [
            IconButton(
              icon: const Icon(Iconsax.calendar_1),
              onPressed: () {
                // Show date range picker or filter dialog
                _selectDateRange(context);
              },
            ),
            IconButton(
              icon: const Icon(Iconsax.arrow_3),
              onPressed: () {
                controller.toggleSortOrder();
              },
            ),
            PopupMenuButton<int>(
              color: primaryColor,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      value: 0,
                      child: CustomText(
                        text: Get.find<HomeLandingController>().isEnglish
                            ? "Arabic"
                            : "English",
                      ))
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  if (Get.find<HomeLandingController>().locale ==
                      const Locale('en', 'US')) {
                    Get.find<HomeLandingController>()
                        .changeLanguage(const Locale('ar', 'AR'));
                  } else {
                    Get.find<HomeLandingController>()
                        .changeLanguage(const Locale('en', 'US'));
                  }
                }
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                return controller.isLoading.value == true
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => const Skelton(
                              height: 60,
                              radius: 5,
                            ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: 10)
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () async {
                                var value = await Get.toNamed(
                                    Routes.ADD_EXPENSE,
                                    arguments: [controller.expenses[index]]);
                                controller.fetchData();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFF29293d),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0xFF3d3d5c),
                                        width: 0.5)),
                                child: ListTile(
                                  leading: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: redColor.withOpacity(0.1),
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.arrow_circle_down_outlined,
                                      color: redColor,
                                    ),
                                  ),
                                  title: CustomText(
                                    text:
                                        "\$${controller.expenses[index].amount}",
                                    size: 20,
                                    weight: FontWeight.w700,
                                  ),
                                  subtitle: CustomText(
                                    text: controller
                                            .expenses[index].description ??
                                        "",
                                  ),
                                  trailing: CustomText(
                                    text: DateFormat("dd-MM-yyyy").format(
                                        controller.expenses[index].date!),
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: controller.expenses.length);
              })
            ],
          ),
        ));
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      controller.setDateRange(picked);
    }
  }
}

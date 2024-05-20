import 'package:expense_tracker/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/summary_controller.dart';

class SummaryView extends GetView<SummaryController> {
  const SummaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "monthly_summary".tr,
          size: 20,
          weight: FontWeight.w800,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.monthlySummaries.length,
          itemBuilder: (context, index) {
            var month = controller.monthlySummaries.keys.elementAt(index);
            var totalAmount = controller.monthlySummaries[month]!;

            return ListTile(
              title: CustomText(
                text: month,
                size: 18,
                weight: FontWeight.w700,
              ),
              trailing: CustomText(
                text: "\$${totalAmount.toStringAsFixed(2)}",
                size: 15,
                weight: FontWeight.w700,
              ),
            );
          },
        );
      }),
    );
  }
}

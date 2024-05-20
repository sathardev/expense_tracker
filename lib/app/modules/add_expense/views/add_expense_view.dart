import 'package:expense_tracker/app/data/constants.dart';
import 'package:expense_tracker/app/widgets/custom_input_date.dart';
import 'package:expense_tracker/app/widgets/custom_input_form_field.dart';
import 'package:expense_tracker/app/widgets/custom_text.dart';
import 'package:expense_tracker/app/widgets/formChildWithTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/add_expense_controller.dart';

class AddExpenseView extends GetView<AddExpenseController> {
  const AddExpenseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.addExpenseHandler();
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: controller.isEditMode.value
                            ? "update".tr
                            : "add_expense".tr),
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            title: CustomText(
              text: controller.isEditMode.value
                  ? "update_expense".tr
                  : "add_expense".tr,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: controller.formKey,
              child: Column(children: [
                FormChildWithTitle(
                    title: "amount".tr,
                    child: CustomInputFormField(
                      required: true,
                      controller: controller.amountController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      inputformatter: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      radius: 8,
                      hintText: "enter_expense_amount".tr,
                    )),
                const SizedBox(
                  height: 20,
                ),
                FormChildWithTitle(
                    title: "date".tr,
                    child: CustomInputDateFormField(
                      required: true,
                      controller: controller.dateController,
                      radius: 8,
                      hintText: "enter_date".tr,
                    )),
                const SizedBox(
                  height: 20,
                ),
                FormChildWithTitle(
                    title: "description".tr,
                    child: CustomInputFormField(
                      required: false,
                      controller: controller.descriptionController,
                      radius: 8,
                      maxLine: 5,
                      hintText: "enter_description".tr,
                    )),
                const SizedBox(
                  height: 40,
                ),
                if (controller.isEditMode.value)
                  InkWell(
                    onTap: () {
                      controller.deleteExpenseHandler();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: redColor, width: 0.5),
                      ),
                      child: CustomText(
                        text: "delete".tr,
                        color: redColor,
                        size: 18,
                      ),
                    ),
                  )
              ]),
            ),
          ));
    });
  }
}

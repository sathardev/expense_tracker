import 'package:expense_tracker/app/data/model/expenseModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/db/db_functions.dart';

class AddExpenseController extends GetxController {
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController(
      text: DateFormat('dd-MM-yyyy').format(DateTime.now()));

  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  RxBool isEditMode = false.obs;

  RxString itemId = "".obs;

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments[0];
    if (data != null) {
      isEditMode.value = true;
      itemId.value = data.id.toString();
      amountController.text = data.amount.toString();
      descriptionController.text = data.description;
      dateController.text = DateFormat('dd-MM-yyyy').format(data.date);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addExpenseHandler() {
    // Extract date components from the date string
    List<String> dateParts = dateController.text.split('-');
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);

    // Create a DateTime object from the extracted components
    DateTime parsedDate = DateTime(year, month, day);
    ExpenseModel data = ExpenseModel(
        amount: double.parse(amountController.text),
        description: descriptionController.text,
        date: parsedDate);

    isLoading.value = true;
    if (isEditMode.value) {
      data.id = itemId.value;
      DbFunctions.updateExpense(data).then((value) {
        isLoading.value = false;
        Get.back(result: true);
      });
    } else {
      DbFunctions.addExpense(data).then((value) {
        isLoading.value = false;
        Get.back(result: true);
      });
    }
  }

  void deleteExpenseHandler() {
    isLoading.value = true;
    DbFunctions.deleteExpense(int.parse(itemId.value)).then((value) {
      isLoading.value = false;
      Get.back(result: true);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/db/db_functions.dart';
import '../../../data/model/expenseModel.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ExpenseModel> expenses = <ExpenseModel>[].obs;

  var filteredExpenses = <ExpenseModel>[].obs;

  var currentPage = 0.obs;
  var sortOrderAsc = true.obs;
  var dateRange = Rxn<DateTimeRange>();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchData() async {
    isLoading.value = true;
    expenses.value = await DbFunctions.getExpenses();
    applyFilters();
    isLoading.value = false;
  }

  void toggleSortOrder() {
    sortOrderAsc.value = !sortOrderAsc.value;
    applyFilters();
  }

  void setDateRange(DateTimeRange range) {
    dateRange.value = range;
    applyFilters();
  }

  void applyFilters() async {
    var filtered = await DbFunctions.getExpenses();

    if (dateRange.value != null) {
      filtered = filtered.where((expense) {
        return expense.date!.isAfter(
                dateRange.value!.start.subtract(const Duration(days: 1))) &&
            expense.date!
                .isBefore(dateRange.value!.end.add(const Duration(days: 1)));
      }).toList();
    }

    filtered.sort((a, b) {
      return sortOrderAsc.value
          ? a.date!.compareTo(b.date!)
          : b.date!.compareTo(a.date!);
    });

    expenses.value = filtered;
  }
}

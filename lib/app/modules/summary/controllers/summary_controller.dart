import 'package:expense_tracker/app/data/db/db_functions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/model/expenseModel.dart';

class SummaryController extends GetxController {
  var expenses = <ExpenseModel>[].obs;
  var monthlySummaries = <String, double>{}.obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    loadExpenses();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadExpenses() async {
    if (isLoading.value) return;

    isLoading.value = true;

    expenses.value = await DbFunctions.getExpenses();
    calculateMonthlySummaries();
    isLoading.value = false;
  }

  void calculateMonthlySummaries() {
    var groupedExpenses = _groupExpensesByMonth();
    var tempSummaries = <String, double>{};

    groupedExpenses.forEach((month, expenses) {
      var total = expenses.fold(0.0, (sum, item) => sum + item.amount!);
      tempSummaries[month] = total;
    });

    monthlySummaries.value = tempSummaries;
  }

  Map<String, List<ExpenseModel>> _groupExpensesByMonth() {
    var formatter = DateFormat('MMMM-yyyy');
    var grouped = <String, List<ExpenseModel>>{};

    for (var expense in expenses) {
      var month = formatter.format(expense.date!);

      if (grouped.containsKey(month)) {
        grouped[month]!.add(expense);
      } else {
        grouped[month] = [expense];
      }
    }

    return grouped;
  }
}

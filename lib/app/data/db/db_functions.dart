import 'dart:math';

import 'package:hive/hive.dart';

import '../model/expenseModel.dart';

class DbFunctions {
  static String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  static Future<bool> addExpense(ExpenseModel expenseModel) async {
    var box = await Hive.openBox<ExpenseModel>('expense_db');
    var id = await box.add(expenseModel);
    expenseModel.id = "$id";
    await box.put(id, expenseModel);
    return true;
  }

  static Future<List<ExpenseModel>> getExpenses() async {
    var box = await Hive.openBox<ExpenseModel>('expense_db');
    return box.values.toList();
  }

  static Future<bool> updateExpense(ExpenseModel expenseModel) async {
    var box = await Hive.openBox<ExpenseModel>('expense_db');
    await box.put(int.parse(expenseModel.id ?? ""), expenseModel);
    return true;
  }

  static Future<bool> deleteExpense(int id) async {
    var box = await Hive.openBox<ExpenseModel>('expense_db');
    await box.delete(id);
    return true;
  }
}

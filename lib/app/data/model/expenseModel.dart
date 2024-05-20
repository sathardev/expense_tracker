import 'package:hive/hive.dart';

part 'expenseModel.g.dart';

@HiveType(typeId: 1)
class ExpenseModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  double? amount;

  @HiveField(2)
  DateTime? date;

  @HiveField(3)
  String? description;

  ExpenseModel({
    this.id,
    this.description,
    this.amount,
    this.date,
  });
}

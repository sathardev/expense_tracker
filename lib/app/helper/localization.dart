import 'package:get/get_navigation/src/root/internacionalization.dart';

class Internalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_name': 'Expense Tracker',
          'home': 'Home',
          'summary': 'Summary',
          'add_expense': 'Add Expense',
          'update_expense': 'Update Expense',
          'amount': 'Amount',
          'date': 'Date',
          'description': 'Description',
          'update': 'Update',
          'delete': 'Delete',
          'enter_expense_amount': 'Enter Expense Amount',
          'enter_date': 'Enter Date',
          'enter_description': 'Enter Description',
          'monthly_summary': 'Monthly Expense Summaries',
        },
        'ar_AR': {
          'app_name': 'محفظة المصاريف',
          'home': 'الرئيسية',
          'summary': 'ملخص',
          'add_expense': 'اضافة المصروف',
          'update_expense': 'تحديث المصروف',
          'amount': 'المبلغ',
          'date': 'التاريخ',
          'description': 'الوصف',
          'update': 'تحديث',
          'delete': 'حذف',
          'enter_expense_amount': 'ادخل المبلغ',
          'enter_date': 'ادخل التاريخ',
          'enter_description': 'ادخل الوصف',
          'monthly_summary': 'ملخص المصروف الشهري',
        }
      };
}

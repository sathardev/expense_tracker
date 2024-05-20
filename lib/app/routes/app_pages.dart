import 'package:get/get.dart';

import '../modules/add_expense/bindings/add_expense_binding.dart';
import '../modules/add_expense/views/add_expense_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_landing/bindings/home_landing_binding.dart';
import '../modules/home_landing/views/home_landing_view.dart';
import '../modules/summary/bindings/summary_binding.dart';
import '../modules/summary/views/summary_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_LANDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_LANDING,
      page: () => const HomeLandingView(),
      binding: HomeLandingBinding(),
    ),
    GetPage(
      name: _Paths.SUMMARY,
      page: () => const SummaryView(),
      binding: SummaryBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EXPENSE,
      page: () => const AddExpenseView(),
      binding: AddExpenseBinding(),
    ),
  ];
}

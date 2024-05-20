import 'package:expense_tracker/app/helper/localization.dart';
import 'package:expense_tracker/app/helper/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'app/data/model/expenseModel.dart';
import 'app/helper/notification_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await NotificationService().scheduleDailyNotification();
  await Hive.initFlutter();

  // Register adapters
  if (!Hive.isAdapterRegistered(ExpenseModelAdapter().typeId)) {
    Hive.registerAdapter(ExpenseModelAdapter());
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: const Locale("en", "US"),
      translations: Internalization(),
      theme: themeData,
    ),
  );
}

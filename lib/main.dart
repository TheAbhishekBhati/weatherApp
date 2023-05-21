import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_task/features/dashboard/controller/dashboard_controller.dart';

import 'features/dashboard/view/pages/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
      onInit: () {
        final DashboardController controller = Get.find<DashboardController>();
        controller.todayForecast();
      },
    );
  }
}

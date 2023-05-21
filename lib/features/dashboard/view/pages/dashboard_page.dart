import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_task/constants/app_colors.dart';
import 'package:weather_app_task/features/dashboard/controller/dashboard_controller.dart';
import 'package:weather_app_task/features/dashboard/view/pages/search_page.dart';
import 'package:weather_app_task/features/dashboard/view/pages/settings_page.dart';

import 'home_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      const SearchPage(),
      const SettingsPage()
    ];
    return Scaffold(
        backgroundColor: AppColors.lightPurple,
        body: SafeArea(
          child: Obx(() => pages[controller.currentPageIndex.value]),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentPageIndex.value,
            onTap: (int index) {
              controller.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.sunny),
                label: 'Today',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ));
  }
}

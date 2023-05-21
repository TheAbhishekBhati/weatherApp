import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_task/features/dashboard/controller/dashboard_controller.dart';

import '../../../../constants/app_colors.dart';
import '../widgets/additional_info_widget.dart';
import '../widgets/weather_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final DashboardController controller = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.center,
              width: size.width,
              child: Text(
                "Today's Weather",
                style: GoogleFonts.nunitoSans(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: AppColors.white),
              )),
          Obx(
            () => Text(
              controller.weather.value.cityName,
              style: GoogleFonts.nunitoSans(
                  fontSize: 26, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          WeatherWidget(size: size, controller: controller),
          const SizedBox(
            height: 30,
          ),
          Container(
              alignment: Alignment.center,
              width: size.width - 40,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white),
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionInfoWidgets(
                          icon: "drops",
                          data: controller.weather.value.humidity.toString(),
                          title: "Humidity"),
                      AdditionInfoWidgets(
                          icon: "wind",
                          data: controller.weather.value.windSpeed.toString(),
                          title: "Wind"),
                      AdditionInfoWidgets(
                          icon: "gauge",
                          data: controller.weather.value.pressure.toString(),
                          title: "Air Pressure"),
                      AdditionInfoWidgets(
                          icon: "visibility",
                          data:
                              "${controller.weather.value.visibility.toString()}m",
                          title: "Visibility"),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../controller/dashboard_controller.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 100,
      height: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: AppColors.darkPurple),
      child: Column(
        children: [
          Image.asset(
            "assets/images/cloud.png",
            height: 220,
            fit: BoxFit.fitHeight,
          ),
          const Spacer(),
          Obx(() => Text(
                controller.units.value == "metric"
                    ? "${controller.weather.value.temperature.toStringAsFixed(1)}\u00B0C"
                    : "${controller.weather.value.temperature.toStringAsFixed(1)}\u00B0F",
                style: GoogleFonts.nunitoSans(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          Obx(
            () => Container(
              color: Colors.white.withOpacity(0.5),
              width: MediaQuery.of(context).size.width - 100,
              height: 40,
              child: controller.weather.value.weatherIcon == ''
                  ? Image.network(
                      "https://openweathermap.org/img/wn/01d@2x.png",
                      fit: BoxFit.fitHeight,
                      height: 40,
                    )
                  : Image.network(
                      "https://openweathermap.org/img/wn/${controller.weather.value.weatherIcon}@2x.png",
                      fit: BoxFit.fitHeight,
                      height: 40,
                    ),
            ),
          ),
          Obx(
            () => Expanded(
              child: Text(
                controller.weather.value.weatherCondition ?? "",
                style: GoogleFonts.nunitoSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_task/constants/helper.dart';

import '../../../../constants/app_colors.dart';
import '../../controller/dashboard_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final DashboardController controller = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Settings',
          style: GoogleFonts.nunitoSans(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: AppColors.darkPurple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Units',
                style: GoogleFonts.nunitoSans(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkPurple),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 4,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width - 200,
              ),
              const SizedBox(height: 25.0),
              DropdownButton(
                value: controller.units.value == "metric"
                    ? "Celsius"
                    : "Fahrenheit",
                icon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: AppColors.darkPurple,
                ),
                iconSize: 24,
                elevation: 16,
                onChanged: (String? newValue) {
                  setState(() {
                    controller.changeUnit(
                        newValue == "Celsius" ? "metric" : "imperial");
                  });
                },
                items: <String>['Celsius', 'Fahrenheit']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: SizedBox(
                        width: 250,
                        height: 60,
                        child: Text(
                          value,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        )),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

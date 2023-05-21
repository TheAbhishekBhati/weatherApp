import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_task/features/dashboard/model/today_forecast_model.dart';

import '../../../constants/helper.dart';
import '../view/pages/error_page.dart';

class DashboardController extends GetxController {
  final cityName = 'Delhi'.obs;
  final units = 'metric'.obs;
  final currentPageIndex = 0.obs;
  final weather = TodaysForecast(
          weatherIcon: '',
          humidity: 0,
          visibility: 0,
          windSpeed: 0,
          pressure: 0,
          cityName: '',
          temperature: 0.0,
          weatherCondition: '')
      .obs;
  void todayForecast() async {
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=$units';
    debugPrint(apiUrl);
    final response = await http.get(Uri.parse(apiUrl));

    try {
      if (response.statusCode == 200) {
        final weatherData = jsonDecode(response.body);
        final cityName = weatherData['name'];
        final temperature = weatherData['main']['temp'];
        final weatherCondition = weatherData['weather'][0]['main'];
        final weatherIcon = weatherData['weather'][0]['icon'];
        final humidity = weatherData['main']['humidity'];
        final pressure = weatherData['main']['pressure'];
        final visibility = weatherData['visibility'];
        final windSpeed = weatherData['wind']['speed'];
        debugPrint("Api hit for city $cityName");
        debugPrint("Api hit for city ${weatherData['main']['temp']}");
        weather.value = TodaysForecast(
            weatherIcon: weatherIcon,
            humidity: humidity,
            visibility: visibility,
            windSpeed: windSpeed,
            pressure: pressure,
            cityName: cityName,
            temperature: temperature,
            weatherCondition: weatherCondition);
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        } // Emit the current state if there's an error
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      Get.to(ErrorPage(error.toString()));
    }
  }

  void changeIndex(int index) {
    currentPageIndex.value = index;
    todayForecast();
    update();
  }

  void changeCity(String city) {
    cityName.value = city;
    todayForecast();
    update();
  }

  void changeUnit(String unit) {
    units.value = unit;
    todayForecast();
    update();
  }
}

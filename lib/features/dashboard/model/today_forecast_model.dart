class TodaysForecast {
  final String cityName;
  final dynamic temperature;
  final String weatherCondition;
  final String weatherIcon;
  final dynamic humidity;
  final int visibility;
  final dynamic windSpeed;
  final int pressure;

  TodaysForecast(
      {required this.weatherIcon,
      required this.humidity,
      required this.visibility,
      required this.windSpeed,
      required this.pressure,
      required this.cityName,
      required this.temperature,
      required this.weatherCondition});
}

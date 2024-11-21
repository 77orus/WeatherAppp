import 'package:weatherapp/models/weather_model.dart';

abstract class weatherState {}

class NoWeatherState extends weatherState {}

class WeatherLoadedState extends weatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailurState extends weatherState {
  final String errMessage;

  WeatherFailurState(this.errMessage);
}

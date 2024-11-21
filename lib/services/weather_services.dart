import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '0d56fcaa40984e9ebdb210930241901';
  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName, }) async {
  try {
    Response response = await dio.get(
    '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1'
    );

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;

  } on DioException catch (e) {
    final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error , please try later';
    throw Exception(errorMessage);
  } catch (e){
    log(e.toString());
    throw Exception('oops there was an error , please try a later');
  }
}
}
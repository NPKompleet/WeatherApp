import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:weatherapp/apikey.dart';
import 'package:weatherapp/src/models/current_weather.dart';
import 'package:weatherapp/src/models/forecast_weather.dart';

class WeatherForecastService{
  String forecastUrl= 'http://api.openweathermap.org/data/2.5/forecast?q=Lagos&units=metric&appid=$APIKey';
  final Client _http;

  WeatherForecastService(this._http);

  Future<ForecastApiData> getWeatherForecast() async {
  try {
    final response = await _http.get(forecastUrl);
    Map decoded = json.decode(response.body);
            
    final apiData= ForecastApiData.fromJson(decoded);
        
    return apiData;
  } catch (e) {
    throw _handleError(e);
  }

  
}

Exception _handleError(dynamic e) {
  print(e);
  return Exception('Server error; cause: $e');
}
}

class CurrentWeatherService{
  String weatherUrl= 'http://api.openweathermap.org/data/2.5/weather?q=Lagos&units=metric&appid=$APIKey';
  final Client _http;

  CurrentWeatherService(this._http);

  Future<CurrentWeatherApiData> getCurrentWeather() async {
  try {
    final response = await _http.get(weatherUrl);
    Map decoded = json.decode(response.body);
            
    final apiData= CurrentWeatherApiData.fromJson(decoded);
        
    return apiData;
  } catch (e) {
    throw _handleError(e);
  }

  
}

Exception _handleError(dynamic e) {
  print(e);
  return Exception('Server error; cause: $e');
}
}
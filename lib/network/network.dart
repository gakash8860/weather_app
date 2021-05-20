import 'dart:convert';

import 'package:weather_app/util/forecastutil.dart';
import 'package:weather_app/weather_forecast/weatherForeCastModel.dart';
import 'package:http/http.dart' as http;
class Network{
  Future<WeatherForeCastModel> getWeatherForecast({required String cityName})async{
    var finalUrl="https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+"&appid=ed60fcfbd110ee65c7150605ea8aceea&units=imperial";
    final response=await http.get(Uri.parse(finalUrl));

  if(response.statusCode>0){
    print(response.statusCode);
    print("weather data : ${response.body}");
    return WeatherForeCastModel.fromJson(jsonDecode(response.body));
  }else{
    throw Exception("Error getting weather forecast");
  }
  }
}
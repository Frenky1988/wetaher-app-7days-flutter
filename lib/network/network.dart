
import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/forecast_util.dart';
import 'package:weather_app/weather_forecats.dart';

class Network{
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl ="https://api.openweathermap.org/data/2.5/forecast?q="+cityName+
        "&appid="+Util.appId+"&units=metric"; //metric or imperial

    final response = await get(Uri.encodeFull(finalUrl));
    
    print("URL: ${Uri.encodeFull(finalUrl)}");//nebitan,samo za proveru

    if (response.statusCode == 200){

      print("Weather data: ${response.body}");
      return WeatherForecastModel.fromJson(jsonDecode(response.body));//we get the actual mapped model(dart object)
    }else{
      throw Exception("Error getting weather forecast");
    }

  }


}
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/convert_icon.dart';
import 'package:weather_app/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0]; //[Saturday,Dec 14, 2019]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main,color: Colors.yellowAccent, size: 40),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Temp:${forecastList[index].main.temp.toStringAsFixed(0)} °C"),
                  ),
                  //Icon(FontAwesomeIcons.temperatureLow, color: Colors.white,size: 17),
                ],
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Hum:${forecastList[index].main.humidity.toStringAsFixed(0)} %"),
                  ),
                  //Icon(FontAwesomeIcons.grinBeamSweat, color: Colors.white,size: 17),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Wind:${forecastList[index].wind.speed.toStringAsFixed(1)} km/h"),
                  ),
                  //Icon(FontAwesomeIcons.wind, color: Colors.white,size: 17),
                ],
              )

            ],
          )
        ],
      ),

    ],

  
  );




}
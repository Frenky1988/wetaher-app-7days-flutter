import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/convert_icon.dart';
import 'package:weather_app/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var forecast = forecastList[0];
    var formatDate = new DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$city, $country",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87
            ),),
            Text("${Util.getFormattedDate(formatDate)}", style: TextStyle(fontSize: 15.0),),
            SizedBox(height: 10.0),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(weatherDescription: forecast.weather[0].main, color: Colors.yellowAccent, size: 200),
            ),
            //Icon(FontAwesomeIcons.cloud, size: 195.0,color: Colors.pink,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${forecast.main.temp.toStringAsFixed(0)} °C", style: TextStyle(fontSize: 34.0),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${forecast.weather[0].description.toUpperCase()}"),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecast.wind.speed.toStringAsFixed(1)} km/h", style: TextStyle(fontSize: 17.0),),
                        Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                        //Icon(Icons.arrow_forward, size: 20.0, color: Colors.brown),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecast.main.humidity.toStringAsFixed(0)} %", style: TextStyle(fontSize: 17.0)),
                        Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20,color: Colors.brown,)

                        //Icon(Icons.hot_tub, size: 20.0, color: Colors.brown),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecast.main.tempMax.toStringAsFixed(0)} °C"),
                        Icon(FontAwesomeIcons.temperatureHigh, size: 20,color: Colors.brown,)
                        //Icon(Icons.wb_sunny, size: 20.0, color: Colors.brown),
                      ],
                    ),
                  )
                ],

              ),
            )

          ],
        ),
      ),


    );


  }
}


Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {

  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var forecast = forecastList[0];
  var formatDate = new DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);

  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$city, $country",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87
          ),),
          Text("${Util.getFormattedDate(formatDate)}", style: TextStyle(fontSize: 15.0),),
          SizedBox(height: 10.0),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWeatherIcon(weatherDescription: forecast.weather[0].main, color: Colors.yellowAccent, size: 200),
        ),
          //Icon(FontAwesomeIcons.cloud, size: 195.0,color: Colors.pink,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${forecast.main.temp.toStringAsFixed(0)} °C", style: TextStyle(fontSize: 34.0),),
                Text("    ${forecast.weather[0].description.toUpperCase()}"),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.wind.speed.toStringAsFixed(1)} km/h", style: TextStyle(fontSize: 17.0),),
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                      //Icon(Icons.arrow_forward, size: 20.0, color: Colors.brown),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.main.humidity.toStringAsFixed(0)} %", style: TextStyle(fontSize: 17.0)),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20,color: Colors.brown,)

                      //Icon(Icons.hot_tub, size: 20.0, color: Colors.brown),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.main.tempMax.toStringAsFixed(0)} °C"),
                      Icon(FontAwesomeIcons.temperatureHigh, size: 20,color: Colors.brown,)
                      //Icon(Icons.wb_sunny, size: 20.0, color: Colors.brown),
                    ],
                  ),
                )
              ],

            ),
          )

        ],
      ),
    ),


  );

  return midView;





}
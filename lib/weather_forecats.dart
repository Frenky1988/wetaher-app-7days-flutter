import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/ui/botom_view.dart';

import 'network/network.dart';
import 'util/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {

  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Berlin";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forecastObject = getWeather(cityName: _cityName);

    // forecastObject.then((weather) => {
    //   print(weather.city.country),
    //   print(weather.list[0].weather[0].main)
    // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textViewField(),
          Container(
            child: FutureBuilder<WeatherForecastModel>//moze, ali nije obavezno
              (future: forecastObject,
                builder: (BuildContext context,AsyncSnapshot<WeatherForecastModel> snapshot){


                if(snapshot.hasData){

                  return Column(
                    children: [
                      MidView(snapshot: snapshot),
                      BottomView(snapshot: snapshot)
                    
                    ],
                  );

                }else {
                  return Center(child: CircularProgressIndicator());
                }

                }),
          )
        ],
      ),
    );
  }

  Widget textViewField() {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Input City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)),
            contentPadding: EdgeInsets.all(8)
          ),
          onSubmitted: (value){
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);

            });

          },
        ),
      ),
    );

  }

  Future<WeatherForecastModel> getWeather({String cityName}) => new Network().getWeatherForecast(cityName: _cityName);
}

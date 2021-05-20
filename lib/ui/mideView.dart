import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/util/conver_icon.dart';
import 'package:weather_app/util/forecastutil.dart';
import 'package:weather_app/weather_forecast/weatherForeCastModel.dart';

Widget midView(AsyncSnapshot <WeatherForeCastModel> snapshot){
var forecastList= snapshot.data!.list;
var cityName= snapshot.data!.city.name;
var country= snapshot.data!.city.country;
var formattedTime=new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt*1000);
Container midView= Container(
  child: Padding(
    padding: const EdgeInsets.all(14.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("${cityName}, ${country}",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 18,
        ),),
        Text("${Util.getFormattedDate(formattedTime)}",style: TextStyle(
          fontSize: 15
        ),),
        SizedBox(height: 10,),
        // Icon(FontAwesomeIcons.cloud,size: 198,color: Colors.grey,),
        // Icon(Icons.wb_sunny,size: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWeatherIcon(weatherDescription: forecastList[0].weather[0].main,color: Colors.amberAccent,size: 198),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("${forecastList[0].temp.day.toStringAsFixed(0)}℉",style: TextStyle(
                fontSize: 34
              ),),
              Text(" ${forecastList[0].weather[0].description.toUpperCase()}"
              //   ,style: TextStyle(
              //     fontSize: 20
              // ),
              ),



          ],
          ),

        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecastList[0].speed.toStringAsFixed(1)} mi/h"),
                      // Icon(Icons.forward ,size: 20,color: Colors.brown,),
                      Icon(FontAwesomeIcons.wind,size: 20,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forecastList[0].humidity.toStringAsFixed(0)} % "),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,),
                      // Icon(Icons.hot_tub ,size: 20,color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text("${forecastList[0].temp.max.toStringAsFixed(0)} ℉"),
                      Icon(FontAwesomeIcons.temperatureHigh,size: 20,),
                      // Icon(Icons.hot_tub ,size: 20,color: Colors.brown,)
                    ],
                  ),
                ),
              ],

            ),
        ),


      ],
    ),
  ),
);
return midView;
}
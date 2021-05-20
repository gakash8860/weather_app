import 'package:flutter/material.dart';
import 'package:weather_app/ui/forecast_Card.dart';
import 'package:weather_app/weather_forecast/weatherForeCastModel.dart';

Widget bottomView(AsyncSnapshot<WeatherForeCastModel> snapshot,BuildContext context){
  var forceCastList =snapshot.data!.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    // Text("7-Day Weather Forecast".toLowerCase(),
    //   style: TextStyle(
    //     fontSize: 18,
    //     color: Colors.black87
    //   ),),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),
        child: ListView.separated(
            separatorBuilder: (context,index)=>SizedBox(width: 8,),
            itemCount: forceCastList.length,
          itemBuilder: (context,index)=>ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width/2.7,
              height: 160,
              // child: forecastCard(snapshot,index),
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(colors: [Colors.blueAccent,Colors.amber],
              //   begin: Alignment.topLeft,
              //     end: Alignment.bottomRight
              //   )
              // ),
            ),
          )
        ),

      ),
    ],
  );
}
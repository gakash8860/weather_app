// import 'package:flutter/material.dart';
// import 'package:weather_app/util/forecastutil.dart';
// import 'package:weather_app/weather_forecast/weatherForeCastModel.dart';
//
//  Widget forecastCard(AsyncSnapshot<WeatherForeCastModel> snapshot,int index){
//    var forceCastList =snapshot.data!.list;
//    var dayOfWeek="";
//    DateTime dateTime = new DateTime.fromMillisecondsSinceEpoch(forceCastList![index].dt*1000);
//    var fullDate=Util.getFormattedDate(dateTime);
//    dayOfWeek=fullDate.split(",")[0];
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      children: <Widget>[
//       Text(dayOfWeek)
//      ],
//    ) ;
//
// }
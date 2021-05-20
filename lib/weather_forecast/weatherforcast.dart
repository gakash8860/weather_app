import 'package:flutter/material.dart';
import 'package:weather_app/network/network.dart';
import 'package:weather_app/ui/mideView.dart';
import 'package:weather_app/util/forecastutil.dart';
import 'package:weather_app/weather_forecast/weatherForeCastModel.dart';

void main()=>runApp(MaterialApp(
  home:WeatherForeCast() ,
));

class WeatherForeCast extends StatefulWidget {
  // const WeatherForeCast({Key key}) : super(key: key);

  @override
  _WeatherForeCastState createState() => _WeatherForeCastState();
}

class _WeatherForeCastState extends State<WeatherForeCast> {
late Future<WeatherForeCastModel> forecastObject;
String cityName="New Delhi ";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject=Network().getWeatherForecast(cityName: cityName);

    // forecastObject.then((weather)=>{
    //     print(weather.list[0].rain)
    // });
  }


  @override
  Widget build(BuildContext context) {
return Scaffold(
  body:ListView(
    children: <Widget>[
      textView(),
      Container(
        child: FutureBuilder<WeatherForeCastModel>(
          future: forecastObject,
          builder: (BuildContext context, AsyncSnapshot<WeatherForeCastModel> snapshot){
            if(snapshot.hasData){
              return Column(
                children: <Widget>[
                  midView(snapshot)
                ],
              );
            }else{
              return Container(child: Center(child: CircularProgressIndicator(),),);
            }
          }),
        ),

    ],
  ) ,
);
  }
 textView(){
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter The City Name",
          prefixIcon: Icon(Icons.search),
           contentPadding: EdgeInsets.all(8)
        ),
        onSubmitted: (value){
        setState(() {
          cityName=value;
          forecastObject=getWeather(cityName);
        });
        },
      ),
    );

}

 Future<WeatherForeCastModel> getWeather(String cityName) =>
     new Network().getWeatherForecast(cityName: cityName);
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather_model.dart';
class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key,required this.weatherModel});
final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    weatherModel.image!.contains("https:");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(weatherModel.cityName,style: const TextStyle(fontSize: 37,fontWeight: FontWeight.bold),),
           Text("updated at : ${weatherModel.date.hour}:${weatherModel.date.minute}",style: const TextStyle(fontSize: 18),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                width: 100,
                  'https:${weatherModel.image!}'),
                Text(weatherModel.temp.toString(),style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),

                 Column(children: [
                  Text("Maxtemp: ${weatherModel.maxTemp.round()}",style:const TextStyle(fontSize: 18),),
                  Text("Mintemp: ${weatherModel.minTemp.round()}",style: const TextStyle(fontSize: 18),),
                ],),

            ],),
        Text(weatherModel.weatherCondition,style: const TextStyle(fontSize: 37,fontWeight: FontWeight.bold),)
        ],),
    ) ;
  }
}
DateTime stringToDateTime(String value){
  return DateTime.parse(value);
}
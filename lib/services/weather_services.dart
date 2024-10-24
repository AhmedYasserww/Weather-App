import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices{
final Dio dio;
final String baseUrl = 'http://api.weatherapi.com/v1';
final String apiKey = 'c9fdb2e223ad496093120729240603 ';
WeatherServices({required this.dio});
Future <WeatherModel> getCurrentWeather({required String cityName})async{
 try {
   Response response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

   WeatherModel weatherModel = WeatherModel.fromJson(response.data);

   return weatherModel;
 } on DioException catch (e) {
   final String messageError = e.response?.data['error']['message']??'oops there was an error';
   throw Exception(messageError);
   // TODO
 }catch (e){
   log(e.toString());
   throw Exception('oops there was an error try latter please!');
 }

}
}
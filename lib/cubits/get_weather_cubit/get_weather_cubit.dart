import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit() : super (NoWeatherState());
  WeatherModel? weatherModel;
  void get_weather({required String cityName})async{
    emit(WeatherLoadedState());
    try {
       weatherModel = await WeatherServices(dio: Dio()).getCurrentWeather(cityName: cityName);
       emit(WeatherSuccess(weatherModel:weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));

    }

  }

}

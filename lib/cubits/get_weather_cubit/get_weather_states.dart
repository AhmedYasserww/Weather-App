import 'package:weather_app/models/weather_model.dart';

class WeatherState{}
class NoWeatherState extends WeatherState{}
class WeatherLoadedState extends WeatherState{

}
class WeatherSuccess extends WeatherState{
  final WeatherModel weatherModel;

  WeatherSuccess({required this.weatherModel});
}
class WeatherFailureState extends WeatherState{
  String errorMessage ;
  WeatherFailureState({required this.errorMessage});
}
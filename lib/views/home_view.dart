import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/No_weather.dart';
import 'package:weather_app/widgets/weather_info.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App",style:TextStyle(fontSize: 30,)),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context,"search");
          }, icon:const Icon(Icons.search,size: 40,),)
        ],
      ),
      //body:const NoWeatherBody()
      body:BlocBuilder<GetWeatherCubit,WeatherState>(
          builder:(context,state){

        if(state is NoWeatherState){
          return const NoWeatherBody();
        }


        else if (state is WeatherLoadedState){
        return const Center(child: CircularProgressIndicator(),);

        }
        else if (state is WeatherSuccess){
              return Column(
                children: [
                  WeatherInfoBody(weatherModel: state.weatherModel),
                  const SizedBox(height: 20,),

                ],
              );
            }
        else{
          return const Text("opps there was an error ",);
        }

      })
    );

  }
}

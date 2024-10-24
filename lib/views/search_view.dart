
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title:
  const Text("Search a City",style: TextStyle(fontSize: 25,))
  ),
      body: Padding(

        padding: const EdgeInsets.all(16),
        child: Center(
          child: TextField(

            onSubmitted: (val)async{
             var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.get_weather(cityName: val);
              Navigator.of(context).pop();
              },

            decoration:const InputDecoration(
             contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16),
              labelText: "Search",
              suffixIcon: Icon(Icons.search),
              hintText: "Enter City Name",
              border: OutlineInputBorder(

              )
            )

          ),
        ),
      ),
    );
  }
}

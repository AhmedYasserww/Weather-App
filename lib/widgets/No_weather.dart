import 'package:flutter/material.dart';
class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("There is no weather😞",style: TextStyle(fontSize: 33),),
        Text("Start Searching now",style: TextStyle(fontSize: 26),)

      ],
    ),);
  }
}

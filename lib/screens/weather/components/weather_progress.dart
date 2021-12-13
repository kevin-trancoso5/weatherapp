import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc.dart';

class WeatherProgress extends StatefulWidget {
  const WeatherProgress({Key? key}) : super(key: key);

  @override
  State<WeatherProgress> createState() => _WeatherProgressState();
}

class _WeatherProgressState extends State<WeatherProgress>
    with TickerProviderStateMixin {
  late AnimationController controller;

  List<String> messages = [
    "Downloading data…",
    "It's about to finish…",
    "Only a few seconds left until the results appear…"
  ];
  late String message;

  @override
  void initState() {
    message = messages.first; 
    getWeather(); //On lance les appels API (via le Bloc) directement lors de l'initiation du state

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 59),
    )..addListener(() {
        setState(() {});
      });
    controller.forward(from: 0); //On fait avancer la barre de progression
    getMessage(); //On fait tourner les messages
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getMessage() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 6));
      int index = messages.indexOf(message);
      if (index == 2) index = -1;
      index++;

      //On vérifie que la state existe toujours avant de faire le setstate
      if (mounted) {
        setState(() {
          message = messages[index];
        });
      }
    }
  }

  void getWeather() async {
    //Il y a sûrement une solution plus optimale pour gérer tout ça, mais afin d'accomplir le test dans le temps imparti j'ai pris cette solution
    BlocProvider.of<WeatherBloc>(context)
        .add(const WeatherLoad(cityName: "Rennes"));
    await Future.delayed(const Duration(seconds: 10));
    BlocProvider.of<WeatherBloc>(context)
        .add(const WeatherLoad(cityName: "Paris"));
    await Future.delayed(const Duration(seconds: 10));
    BlocProvider.of<WeatherBloc>(context)
        .add(const WeatherLoad(cityName: "Nantes"));
    await Future.delayed(const Duration(seconds: 10));
    BlocProvider.of<WeatherBloc>(context)
        .add(const WeatherLoad(cityName: "Bordeaux"));
    await Future.delayed(const Duration(seconds: 10));
    BlocProvider.of<WeatherBloc>(context)
        .add(const WeatherLoad(cityName: "Lyon"));
    await Future.delayed(const Duration(seconds: 20));
    BlocProvider.of<WeatherBloc>(context).add(WeatherShow());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            message,
            style: const TextStyle(fontSize: 20),
          ),
          LinearProgressIndicator(
            value: controller.value,
            semanticsLabel: 'Weather loading...',
          ),
        ],
      ),
    );
  }
}

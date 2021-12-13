import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weatherapp/blocs/weather_bloc.dart';
import 'package:weatherapp/services/size_config.dart';
import 'package:weatherapp/widgets/main_container.dart';
import 'package:weatherapp/widgets/spacers/big_spacer.dart';
import 'package:weatherapp/screens/weather/components/weather_progress.dart';

import 'components/weather_table.dart';

class Weather extends StatefulWidget {
  static const String id = 'weather_screen';

  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    WeatherState state = context.watch<WeatherBloc>().state;
    return MainContainer(
      canQuit: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            bigSpacer(context),
            if (state is! WeatherDisplay) const WeatherProgress(), //Progress bar
            if (state is WeatherDisplay) const WeatherTable(), //Tableau final
            //On a divisé la progress bar du tableau final dans un soucis de simplicité par rapport à la durée du test
          ],
        ),
      ),
    );
  }
}

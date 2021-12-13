import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc.dart';
import 'package:weatherapp/screens/weather/weather.dart';
import 'package:weatherapp/services/size_config.dart';
import 'package:weatherapp/widgets/main_container.dart';
import 'package:weatherapp/widgets/spacers/big_spacer.dart';

class Home extends StatefulWidget {
  static const String id = 'home_screen';

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      canQuit: true,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            bigSpacer(context),
            Text(
              'Weather App',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: widthBloc(context) * 10),
            ),
            bigSpacer(context),
            Container(
              width: widthBloc(context) * 80,
              padding: EdgeInsets.all(widthBloc(context) * 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white30),
              child: TextButton(
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context).add(WeatherReset()); //On reset dans tous les cas pour éviter tout conflit potentiel dans le Bloc.
                    Navigator.pushNamed(context, "/weather");
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(50)),
                    child: Center(child: Text("Go", style: TextStyle(color: Colors.white, fontSize: widthBloc(context) * 3),)))),
            )
          ],
        ),
      ),
    );
  }
}

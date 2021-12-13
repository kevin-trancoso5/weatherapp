import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc.dart';

class WeatherTable extends StatelessWidget {
  const WeatherTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherDisplay state = context.watch<WeatherBloc>().state as WeatherDisplay;

    return Column(
      children: [
        DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'City',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Temperature',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Wind cover',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: List<DataRow>.generate(
                state.cities.length,
                (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(state.cities.elementAt(index).cityName)),
                        DataCell(Text(state.cities
                            .elementAt(index)
                            .temperature
                            .toStringAsFixed(2))), //2 chiffres après la virgule
                        DataCell(Image.network(
                            state.cities.elementAt(index).getIconUrl)),
                      ],
                    ))),
        TextButton(
            onPressed: () {
              Navigator.pop(context); //Retour au home
            },
            child: const Text("Restart")),
      ],
    );
  }
}

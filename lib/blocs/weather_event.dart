part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}


class WeatherLoad extends WeatherEvent {

  final String cityName;
  
  const WeatherLoad({required this.cityName});

  @override
  List<Object> get props => [cityName];



  @override
  String toString() => 'WeatherLoad';
}


class WeatherShow extends WeatherEvent {}

class WeatherReset extends WeatherEvent {}


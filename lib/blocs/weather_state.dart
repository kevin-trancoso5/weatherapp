part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherUninitialized extends WeatherState {
  const WeatherUninitialized();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'WeatherUninitialized';
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'WeatherLoading';
}

class WeatherLoaded extends WeatherState {
  final List<CityWeather> cities;
  
  const WeatherLoaded({required this.cities});

  @override
  List<Object> get props => [cities];

  @override
  String toString() => 'WeatherLoaded { cities: $cities }';
}

class WeatherDisplay extends WeatherState {
  final List<CityWeather> cities;
  
  const WeatherDisplay({required this.cities});

  @override
  List<Object> get props => [cities];

  @override
  String toString() => 'WeatherDisplay { cities: $cities }';
}


import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weatherapp/models/city_weather.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;

  WeatherBloc({required this.weatherService})
      : super(const WeatherUninitialized()) {
    on<WeatherLoad>(_mapWeatherLoadToState);
    on<WeatherShow>(_mapWeatherShowToState);
    on<WeatherReset>(_mapWeatherResetToState);
  }

  Future<void> _mapWeatherLoadToState(
      WeatherLoad event, Emitter<WeatherState> emit) async {
    List<CityWeather> cities = [];
    if (state is WeatherLoaded) {
      WeatherLoaded currentState = state as WeatherLoaded;
      cities = currentState.cities;
    }
    CityWeather cityWeather = await weatherService.getWeather(event.cityName);
    cities.add(cityWeather);
    emit(WeatherLoaded(cities: cities));
  }

  Future<void> _mapWeatherShowToState(
      WeatherShow event, Emitter<WeatherState> emit) async {
    List<CityWeather> cities = [];
    if (state is WeatherLoaded) {
      WeatherLoaded currentState = state as WeatherLoaded;
      cities = currentState.cities;
    }
    emit(WeatherDisplay(cities: cities));
  }

  Future<void> _mapWeatherResetToState(
      WeatherReset event, Emitter<WeatherState> emit) async {
    emit(const WeatherUninitialized());
  }
}

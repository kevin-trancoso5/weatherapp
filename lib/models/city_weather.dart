class CityWeather {
  final String cityName;
  final double temperature;
  final String icon;

  CityWeather({required this.cityName, required this.temperature, required this.icon});

  String get getIconUrl{
    return 'https://openweathermap.org/img/wn/$icon@2x.png';
  }

  factory CityWeather.fromJson(Map<String, dynamic> json){
    final cityName = json['name'];
    double temperature = json['main']['temp'];
    final icon = json['weather'][0]['icon'];

    temperature = (temperature - 272.15);

    return CityWeather(cityName: cityName, temperature: temperature, icon:icon);
  }
}
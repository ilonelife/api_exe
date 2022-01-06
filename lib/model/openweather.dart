class OpenWeather {
  late final double temp;
  late final double feelsLike;
  late final double low;
  late final double high;
  late final dynamic description;
  late final double pressure;
  late final double humidity;
  late final double wind;
  late final String icon;

  OpenWeather(
      {required this.temp,
      required this.feelsLike,
      required this.low,
      required this.high,
      required this.description,
      required this.pressure,
      required this.humidity,
      required this.wind,
      required this.icon});

  factory OpenWeather.fromJson(Map<String, dynamic> json) {
    return OpenWeather(
      temp: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      low: json['main']['temp_min'],
      high: json['main']['temp_max'],
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'],
      icon: json['weather'][0]['icon'],
    );
  }
}

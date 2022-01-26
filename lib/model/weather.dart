class Weather {
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final double pressure;
  final double humidity;
  final double windSpeed;
  final double windDeg;
  final String icon;

  Weather(
      {required this.temp,
      required this.feelsLike,
      required this.low,
      required this.high,
      required this.description,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.windDeg,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    //  print('Weather ----------------------');
    //  print(json);
    return Weather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      windDeg: json['wind']['deg'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}
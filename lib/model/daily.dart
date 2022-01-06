class Daily {
  late final int dt;
  late final double temp;
  late final double feelsLike;
  late final double low;
  late final double high;
  late final String description;
  late final double pressure;
  late final double humidity;
  late final double wind;
  late final String icon;

  Daily(
      {required this.dt,
      required this.temp,
      required this.feelsLike,
      required this.low,
      required this.high,
      required this.description,
      required this.pressure,
      required this.humidity,
      required this.wind,
      required this.icon});

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      dt: json['dt'].toInt(),
      temp: json['temp']['day'].toDouble(),
      feelsLike: json['feels_like']['day'].toDouble(),
      low: json['temp']['min'].toDouble(),
      high: json['temp']['max'].toDouble(),
      description: json['weather'][0]['description'],
      pressure: json['pressure'].toDouble(),
      humidity: json['humidity'].toDouble(),
      wind: json['wind_speed'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}

class Hourly {
  late final int dt;
  late final double temp;
  late final double feelsLike;
  late final double pressure;
  late final double dewPoint;
  late final double uvi;
  late final double visibility;
  late final double wind;
  late final String description;
  late final String icon;

  Hourly(
      {required this.dt,
      required this.temp,
      required this.feelsLike,
      required this.pressure,
      required this.dewPoint,
      required this.uvi,
      required this.visibility,
      required this.wind,
      required this.description,
      required this.icon});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      dt: json['dt'].toInt(),
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'].toDouble(),
      dewPoint: json['dew_point'].toDouble(),
      uvi: json['uvi'].toDouble(),
      visibility: json['visibility'].toDouble(),
      wind: json['wind_speed'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}

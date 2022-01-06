import 'daily.dart';
import 'hourly.dart';

class Forecast {
  late final List<Hourly> hourly;
  late final List<Daily> daily;

  Forecast({required this.hourly, required this.daily});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['hourly'];
    List<dynamic> dailyData = json['daily'];

    List<Hourly> _hourly = [];
    List<Daily> _daily = [];

    hourlyData.forEach((item) {
      var hour = Hourly.fromJson(item);
      _hourly.add(hour);
    });

    // hourlyData.map((e) => Hourly.fromJson(e)).toList();

    dailyData.forEach((item) {
      var day = Daily.fromJson(item);
      _daily.add(day);
    });

    // dailyData.map((e) => Daily.fromJson(e)).toList();
    //  print('Forcast -----------------');
    //  print(json);
    return Forecast(hourly: _hourly, daily: _daily);
  }
}

import 'dart:convert';

import 'package:api_exe/model/location.dart';
import 'package:api_exe/model/weather.dart';
import 'package:http/http.dart' as http;

// 특정 도시의 현재 날씨 가져오기
Future getCurrentWeather(Location location) async {
  String city = location.city;
  String apiKey = '5a65e5ac9b7dbbcc1466f9e52e7540fb';
  var _url =
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

  final response = await http.get(Uri.parse(_url));

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  }
}

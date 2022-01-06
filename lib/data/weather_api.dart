import 'dart:convert';

import 'package:api_exe/model/one_call.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future fetchWeather() async {
    String city = 'seoul';
    const apiKey = '5a65e5ac9b7dbbcc1466f9e52e7540fb';
    const lat = '37.49440990390671';
    const lon = '126.969619682881';
    final currentUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    const String oneCallUrl =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

    //  final response = await http.get(Uri.parse(currentUrl));
    final response = await http.get(Uri.parse(oneCallUrl));

    if (response.statusCode == 200) {
      // return Current.fromJson(jsonDecode(response.body)['current']);
      return OneCall.fromJson(jsonDecode(response.body));

      // return OpenWeather.fromJson(jsonDecode(response.body));
      // return jsonList.map((e) => OpenWeather.fromJson(e)).toList();
    } else {
      throw Exception('Fail to load weather data');
    }
  }
}

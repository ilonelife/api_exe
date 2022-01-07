import 'dart:convert';

import 'package:api_exe/model/one_call.dart';
import 'package:http/http.dart' as http;

class OneCallApi {
  Future<OneCall> fetchOneCall() async {
    String city = 'seoul';
    const apiKey = '5a65e5ac9b7dbbcc1466f9e52e7540fb';
    const lat = '37.49440990390671';
    const lon = '126.969619682881';

    const String oneCallUrl =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(oneCallUrl));

    if (response.statusCode == 200) {
      return OneCall.fromJson(jsonDecode(response.body));
      // return OpenWeather.fromJson(jsonDecode(response.body));
      // return jsonList.map((e) => OpenWeather.fromJson(e)).toList();
    } else {
      throw Exception('Fail to load weather data');
    }
  }

  Future fetchCurrent() async {
    String city = 'seoul';
    const apiKey = '5a65e5ac9b7dbbcc1466f9e52e7540fb';
    const lat = '37.49440990390671';
    const lon = '126.969619682881';

    const String oneCallUrl =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(oneCallUrl));

    if (response.statusCode == 200) {
      return OneCall.fromJson(jsonDecode(response.body)['current']);
      // return OpenWeather.fromJson(jsonDecode(response.body));
      // return jsonList.map((e) => OpenWeather.fromJson(e)).toList();
    } else {
      throw Exception('Fail to load weather data');
    }
  }

  Future fetchDaily() async {
    String city = 'seoul';
    const apiKey = '5a65e5ac9b7dbbcc1466f9e52e7540fb';
    const lat = '37.49440990390671';
    const lon = '126.969619682881';

    const String oneCallUrl =
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(oneCallUrl));

    if (response.statusCode == 200) {
      List jsonDaily = jsonDecode(response.body)['daily'];
      return jsonDaily.map((e) => Daily.fromJson(e)).toList();
    } else {
      throw Exception('Fail to load weather data');
    }
  }
}

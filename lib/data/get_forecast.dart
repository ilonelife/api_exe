import 'dart:convert';

import 'package:api_exe/model/forecast.dart';
import 'package:api_exe/model/location.dart';
import 'package:http/http.dart' as http;

Future getForcecast(Location location) async {
  Forecast forecast;
  String apiKey = '5a65e5ac9b7dbbcc1466f9e52e7540fb';
  String lat = location.lat;
  String lon = location.lon;
  var _url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

  final response = await http.get(Uri.parse(_url));

  if (response.statusCode == 200) {
    return Forecast.fromJson(jsonDecode(response.body));
  }
}

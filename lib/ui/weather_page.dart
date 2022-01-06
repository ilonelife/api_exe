import 'package:api_exe/data/weather_api.dart';
import 'package:api_exe/model/one_call.dart';
import 'package:api_exe/model/openweather.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  OpenWeather? _currentWeather;
  Current? _current;
  OneCall? _oneCall;

  final _api = WeatherApi();

  Future<void> _showResult() async {
    // OpenWeather weather = await _api.fetchWeather();
    // Current weather = await _api.fetchWeather();
    OneCall weather = await _api.fetchWeather();

    setState(() {
      // _currentWeather = weather;
      _oneCall = weather;
    });
  }

  @override
  void initState() {
    super.initState();
    _showResult();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                // '${_current?.temp} °C',
                '${_oneCall?.current.temp} °C',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '${_oneCall?.current.humidity}',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '${_currentWeather?.feelsLike} °C',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'H : ${_currentWeather?.high} °C L : ${_currentWeather?.low} °C',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

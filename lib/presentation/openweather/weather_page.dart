import 'package:api_exe/data/one_call_api.dart';
import 'package:api_exe/model/one_call.dart';
import 'package:api_exe/model/openweather.dart';
import 'package:api_exe/util/get_timestamp.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  OpenWeather? _currentWeather;
  OneCall? _oneCall;
  List<Daily> _daily = [];
  // Daily? _daily;

  final _api = OneCallApi();

  Future<void> _showResult() async {
    // OpenWeather weather = await _api.fetchWeather();
    OneCall weather = await _api.fetchOneCall();

    setState(() {
      // _currentWeather = weather;
      _oneCall = weather;
    });
  }

  Future<void> _showDaily() async {
    List<Daily> daily = await _api.fetchDaily();
    _daily = daily;
  }

  @override
  void initState() {
    super.initState();
    _showResult();
    _showDaily();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON to DART 방식'),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
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
              '습도 : ${_oneCall?.current.humidity}',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '체감온도 : ${_oneCall?.current.feelsLike} °C',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'description : ${_oneCall?.current.weather[0].description}',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: _daily.length,
                itemBuilder: (BuildContext cotext, index) {
                  return Container(
                    child: Text(
                        '${getDateFromTimestamp(_daily[index].dt)} / ${_daily[index].windSpeed} / ${_daily[index].windDeg} / ${_daily[index].weather[0].description}'),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

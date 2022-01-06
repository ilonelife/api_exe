import 'package:api_exe/data/get_current_weather.dart';
import 'package:api_exe/data/get_forecast.dart';
import 'package:api_exe/model/forecast.dart';
import 'package:api_exe/model/location.dart';
import 'package:api_exe/model/weather.dart';
import 'package:api_exe/ui/extensions.dart';
import 'package:api_exe/util/get_timestamp.dart';
import 'package:api_exe/util/get_weather_icon.dart';
import 'package:flutter/material.dart';

class CurrentWeatherPage extends StatefulWidget {
  final List<Location> locations;
  final BuildContext context;

  const CurrentWeatherPage(this.locations, this.context);

  @override
  _CurrentWeatherPageState createState() =>
      _CurrentWeatherPageState(this.locations, this.context);
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final List<Location> locations;
  final Location location;
  final BuildContext context;

  _CurrentWeatherPageState(List<Location> locations, BuildContext context)
      : this.locations = locations,
        this.location = locations[0],
        this.context = context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
        ),
        backgroundColor: Colors.grey[100],
        body: ListView(children: <Widget>[
          currentWeatherViews(this.locations, this.location, this.context),
          forcastViewsHourly(this.location),
          forcastViewsDaily(this.location),
        ]));
  }
}

// 현재 날씨 표시 위젯
Widget currentWeatherViews(
    List<Location> locations, Location location, BuildContext context) {
  Weather? _weather;

  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data == null) {
          return Text('Error getting weather');
        } else {
          _weather = snapshot.data as Weather?;
          return Column(
            children: [
              createAppBar(locations, location, context),
              weatherBox(_weather!),
              weatherDetailsBox(_weather!),
            ],
          );
        }
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
    future: getCurrentWeather(location),
  );
}

// 시간대별 날씨 표시 위젯
Widget forcastViewsHourly(Location location) {
  Forecast? _forcast;

  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data == null) {
          return Text("Error getting weather");
        } else {
          _forcast = snapshot.data as Forecast?;
          return hourlyBoxes(_forcast!);
        }
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
    future: getForcecast(location),
  );
}

Widget forcastViewsDaily(Location location) {
  Forecast? _forcast;

  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data == null) {
          return Text("Error getting weather");
        } else {
          _forcast = snapshot.data as Forecast?;
          return dailyBoxes(_forcast!);
        }
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
    future: getForcecast(location),
  );
}

Widget hourlyBoxes(Forecast _forcast) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 0.0),
    height: 150.0,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _forcast.hourly.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding:
                const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '${_forcast.hourly[index].temp}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
                getWeatherIcon(_forcast.hourly[index].icon),
                Text('${getTimeFromTimestamp(_forcast.hourly[index].dt)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Colors.grey)),
              ],
            ),
          );
        }),
  );
}

Widget dailyBoxes(Forecast _forcast) {
  return ListView.builder(
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    itemCount: _forcast.daily.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
        margin: const EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
                child: Text(
              '${getDateFromTimestamp(_forcast.daily[index].dt)},',
              style: TextStyle(fontSize: 14, color: Colors.black),
            )),
            Expanded(child: getWeatherIconSmall(_forcast.daily[index].icon)),
            Expanded(
              child: Text(
                '${_forcast.daily[index].high.toInt()} / ${_forcast.daily[index].low.toInt()}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            )
          ],
        ),
      );
    },
  );
}

// 화면 상단 날씨 지역 표시
Widget createAppBar(
    List<Location> locations, Location location, BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 15, left: 20, bottom: 15, right: 20),
    margin:
        const EdgeInsets.only(top: 35, left: 15.0, bottom: 15.0, right: 15.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(60)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ]),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(
            text: ' ${location.city.capitalizeFirstOfEach} ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(
            text: ' ${location.country.capitalizeFirstOfEach} ',
            style: const TextStyle(fontSize: 16),
          ),
        ])),
        const Icon(Icons.keyboard_arrow_down_rounded),
      ],
    ),
  );
}

// 현재날씨 - 바람, 습도, 기압 표
weatherDetailsBox(Weather _weather) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
    margin: const EdgeInsets.only(left: 15, top: 5, bottom: 15, right: 15),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                child: const Text(
                  '바람',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ),
              Container(
                child: Text(
                  '${_weather.windSpeed} km/h',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                child: const Text(
                  '습도',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ),
              Container(
                child: Text(
                  '${_weather.humidity.toInt()} %',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                child: const Text(
                  '기압',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ),
              Container(
                child: Text(
                  '${_weather.pressure} hPa',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// 현재날씨 - 기상, 온도 표시
Widget weatherBox(Weather _weather) {
  return Stack(
    children: [
      Container(
        // 오늘 날씨 박스 만들기
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(15.0),
        height: 160.0,
        decoration: const BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      ClipPath(
        // 박스 안에 물결 무늬 만들기
        clipper: CostomClipper(),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          height: 160.0,
          decoration: BoxDecoration(
              color: Colors.indigoAccent[400],
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(15.0),
        height: 180.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  getWeatherIcon(_weather.icon),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      _weather.description.capitalizeFirstOfEach,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: Text(
                      'H:${_weather.high.toInt()}°  L:${_weather.low.toInt()}°',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  child: Text(
                    '${_weather.temp.toInt()}°',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 56,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  child: Text(
                    '체감온도: ${_weather.feelsLike.toInt()}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

class CostomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height - 20);

    path.quadraticBezierTo((size.width / 6) * 1, (size.height / 2) + 15,
        (size.width / 3) * 1, size.height - 30);
    path.quadraticBezierTo((size.width / 2) * 1, (size.height + 0),
        (size.width / 3) * 2, (size.height / 4) * 3);
    path.quadraticBezierTo((size.width / 6) * 5, (size.height / 2) - 20,
        size.width, size.height - 60);

    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CostomClipper oldClipper) => false;
}

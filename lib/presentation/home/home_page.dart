import 'package:api_exe/model/location.dart';
import 'package:api_exe/presentation/openweather/weather_page.dart';
import 'package:api_exe/presentation/pixabay/pixabay_screen.dart';
import 'package:flutter/material.dart';

import '../tmdb/movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Location> locations = [
    Location(
        city: "Suwon ",
        country: "Korea",
        lat: "37.27353561794753",
        lon: "127.03411954945867"),
    Location(
        city: "Seoul",
        country: "Korea",
        lat: "37.52355065829156",
        lon: "126.92327111272373"),
    Location(
        city: "Jeju",
        country: "Korea",
        lat: "33.415686463433765",
        lon: "126.56531423452492"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2014/04/03/10/50/whale-311477_960_720.png'),
                      ),
                    ),
                  ),
                  const Text(
                    'Oneslife',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.image_outlined),
              title: const Text(
                'pixabay',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: const Text('픽사베이 사진 검색'),
              trailing: const Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PixabayScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.live_tv_outlined),
              title: const Text(
                'TMDB',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: const Text('영화 검색 API'),
              trailing: const Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoviePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.air_outlined),
              title: const Text(
                'openweather',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('날씨 API'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WeatherPage(), // CurrentWeatherPage(locations, context),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station_outlined),
              title: const Text(
                '요소수 재고',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('공공 데이터 오픈 API'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station_outlined),
              title: const Text(
                'JSONPlaceholder',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('{JSON} Placeholder'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('개발 레퍼런스'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Flutter 클린 코딩 및\n 유용한 소스 레퍼런스 모음',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

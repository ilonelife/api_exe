import 'package:api_exe/ui/pixabay_page.dart';
import 'package:flutter/material.dart';

import 'movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              subtitle: const Text('사진 검색 API'),
              trailing: const Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PixabayPage(),
                    ));
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station_outlined),
              title: const Text(
                '요소수',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text('요소수 재고 공공 API'),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('API통신'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              child: Text('Fetch data from the internet'),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black87,
                  backgroundColor: Colors.white,
                  textStyle:
                      TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
              onPressed: () {},
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Pixabay API'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('TMDB API'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Open Weather API'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('요소수 재고 API'),
            ),
          ],
        ),
      ),
    );
  }
}
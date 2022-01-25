import 'dart:async';

import 'package:api_exe/data/movie_api.dart';
import 'package:api_exe/model/movie.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<Movie> _movies = [];
  List<Movie> _origin = [];

  Timer? _debounce;
  final _api = MovieApi();
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _showResult();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _showResult() async {
    List<Movie> movies = await _api.fetchMovies();
    setState(() {
      _movies = movies;
      _origin = _movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'TMDB 영화 API',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _origin = _movies;
                });
              },
              icon: Icon(Icons.restart_alt_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            _buildTextField(),
            Expanded(
              child: _buildGridView(),
            ),
          ],
        ));
  }

  // 검색 기능 함수
  // 키 입력이 멈춘 Duration 시간 이후 검색을 진행함
  // 매번 검색하게 되면 서버 부하를 주게 되므로 이를 개선 함
  void onQueryChanged(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _origin = _movies
            .where(
              (e) => e.title.contains(query),
            )
            .toList();
      });
    });
  }

  TextField _buildTextField() {
    return TextField(
      onChanged: onQueryChanged,
      controller: _textEditingController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        hintText: '검색어를 입력하세요',
      ),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 5,
        childAspectRatio: 0.5,
      ),
      itemCount: _origin.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              child: Hero(
                child: Image.network('https://image.tmdb.org/t/p/original' +
                    _origin[index].posterPath),
                tag: 'movie',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: _origin[index].title,
                      overView: _origin[index].overview,
                      posterPath: _origin[index].posterPath,
                      backdropPath: _origin[index].backdropPath,
                      releaseDate: _origin[index].releaseDate,
                      voteAverage: _origin[index].voteAverage,
                      voteCount: _origin[index].voteCount,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              _origin[index].title,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}

import 'dart:convert';

import 'package:api_exe/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  Future<List<Movie>> fetchMovies() async {
    // 참고용.  0.5초 기다림
    await Future<void>.delayed(const Duration(milliseconds: 500));

    String url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Movie.listToMovie(jsonDecode(response.body)['results']);
      //  List jsonList = jsonDecode(response.body)['results'];
      //  return jsonList.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Movies');
    }
  }
}

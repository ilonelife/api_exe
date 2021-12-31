import 'dart:convert';

import 'package:api_exe/model/pixabay.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  Future<List<Pixabay>> fetchPixabay(String query) async {
    String url = 'https://pixabay.com/api/?'
        'key=24806095-fea70a37f71c6222b27afd5be&q=$query&image_type=photo&pretty=true';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResult = jsonDecode(response.body)['hits'];
      return jsonResult.map((e) => Pixabay.fromJson(e)).toList();
      //  return Pixabay.listToPixabays(jsonDecode(response.body)['hits']);
    } else {
      throw Exception('Fail to load Pixabay Data');
    }
  }
}

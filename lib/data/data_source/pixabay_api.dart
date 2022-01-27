import 'dart:convert';

import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '24806095-fea70a37f71c6222b27afd5be';

  Future<Iterable> fetchPixabays(String query) async {
    final response = await client.get(
        Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits; //jsonResult.map((e) => Pixabay.fromJson(e)).toList();
  }
}

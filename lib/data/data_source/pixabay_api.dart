import 'dart:convert';

import 'package:api_exe/data/data_source/result.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '24806095-fea70a37f71c6222b27afd5be';

  /*
  픽사베이 API 를 이용해서 사진 데이터 가져오기
  query를 입력받아서 검색어 처리할 수 있게 함
   */
  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true'),
      );
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits); // success 타입의 클래스를 만들고(생성자), hits 데이터를 반환한다
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}

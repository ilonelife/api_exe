import 'package:api_exe/data/data_source/pixabay_api.dart';
import 'package:api_exe/data/data_source/result.dart';
import 'package:api_exe/domain/model/pixabay.dart';
import 'package:api_exe/domain/repository/photo_api_repository.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<Result<List<Pixabay>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);

    // 반환된 result의 결과도 성공과 실패로 구분해서 처리하게 됨
    // 이때 when 함수를 사용함
    return result.when(success: (hits) {
      return Result.success(hits.map((e) => Pixabay.fromJson(e)).toList());
    }, error: (message) {
      return Result.error(message);
    });
  }
}

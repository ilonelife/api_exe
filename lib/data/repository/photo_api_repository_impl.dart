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

    return result.when(success: (iterable) {
      return Result.success(iterable.map((e) => Pixabay.fromJson(e)).toList());
    }, error: (message) {
      return Result.error(message);
    });
  }
}

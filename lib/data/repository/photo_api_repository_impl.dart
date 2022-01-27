import 'package:api_exe/data/data_source/pixabay_api.dart';
import 'package:api_exe/domain/model/pixabay.dart';
import 'package:api_exe/domain/repository/photo_api_repository.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Pixabay>> fetchPixabays(String query) async {
    final result = await api.fetchPixabays(query);
    return result.map((e) => Pixabay.fromJson(e)).toList();
  }
}

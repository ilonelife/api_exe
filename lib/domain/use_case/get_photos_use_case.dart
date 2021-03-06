import 'package:api_exe/data/data_source/result.dart';
import 'package:api_exe/domain/model/pixabay.dart';
import 'package:api_exe/domain/repository/photo_api_repository.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<Pixabay>>> call(String query) async {
    final result = await repository.fetch(query);

    return result.when(success: (pixabays) {
      return Result.success(pixabays);
    }, error: (message) {
      return Result.error(message);
    });
  }
}

import 'package:api_exe/data/data_source/result.dart';
import 'package:api_exe/domain/model/pixabay.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Pixabay>>> fetch(String query);
}

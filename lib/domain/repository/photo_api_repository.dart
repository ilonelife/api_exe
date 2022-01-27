import 'package:api_exe/domain/model/pixabay.dart';

abstract class PhotoApiRepository {
  Future<List<Pixabay>> fetchPixabays(String query);
}

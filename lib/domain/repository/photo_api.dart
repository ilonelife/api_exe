import 'package:api_exe/domain/model/pixabay.dart';

abstract class PhotoApi {
  Future<List<Pixabay>> fetchPixabays(String query);
}

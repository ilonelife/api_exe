import 'package:api_exe/domain/model/pixabay.dart';
import 'package:api_exe/domain/repository/photo_api.dart';
import 'package:flutter/material.dart';

class PhotoViewModel with ChangeNotifier {
  List<Pixabay> pixabays = [];

  PhotoApi _api;

  PhotoViewModel(this._api);

  Future<void> fetchPhoto(String query) async {
    // 상태가 변하는 타이밍
    pixabays = (await _api.fetchPixabays(query)).cast<Pixabay>();
    notifyListeners();
  }
}

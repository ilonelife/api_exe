import 'package:api_exe/data/data_source/result.dart';
import 'package:api_exe/domain/model/pixabay.dart';
import 'package:api_exe/domain/repository/photo_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PhotoViewModel with ChangeNotifier {
  PhotoApiRepository repository;

  List<Pixabay> _pixabays = [];

  UnmodifiableListView<Pixabay> get pixabays => UnmodifiableListView(_pixabays);

  PhotoViewModel(this.repository);

  Future<void> fetchPhoto(String query) async {
    final Result<List<Pixabay>> result = await repository.fetch(query);

    // 상태가 변하는 타이밍
    result.when(success: (pixabays) {
      _pixabays = pixabays;
      notifyListeners();
    }, error: (message) {
      print(message);
    });

    //  _pixabays = (await repository.fetch(query));
  }
}

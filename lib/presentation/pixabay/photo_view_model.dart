import 'dart:async';

import 'package:api_exe/data/data_source/result.dart';
import 'package:api_exe/domain/model/pixabay.dart';
import 'package:api_exe/domain/repository/photo_api_repository.dart';
import 'package:api_exe/presentation/pixabay/pixabay_ui_event.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PhotoViewModel with ChangeNotifier {
  PhotoApiRepository repository;

  List<Pixabay> _pixabays = [];

  UnmodifiableListView<Pixabay> get pixabays => UnmodifiableListView(_pixabays);

  // 네트워크 연결 중인 경우 진행상태 표시 하기 위한 처리
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // 이벤트를 처리하기 위한 stream 기능
  final _eventController = StreamController<PixabayUiEvent>();
  Stream<PixabayUiEvent> get eventStream => _eventController.stream;

  PhotoViewModel(this.repository);

  Future<void> fetchPhoto(String query) async {
    _isLoading = true;
    notifyListeners();

    final Result<List<Pixabay>> result = await repository.fetch(query);

    // 상태가 변하는 타이밍
    result.when(
      success: (pixabays) {
        _pixabays = pixabays;
        notifyListeners();
      },
      error: (message) {
        _eventController.add(PixabayUiEvent.showSnackBar(message));
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}

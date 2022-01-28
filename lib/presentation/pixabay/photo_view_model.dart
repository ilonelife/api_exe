import 'dart:async';

import 'package:api_exe/data/data_source/result.dart';
import 'package:api_exe/domain/model/pixabay.dart';
import 'package:api_exe/domain/use_case/get_photos_use_case.dart';
import 'package:api_exe/presentation/pixabay/pixabay_state.dart';
import 'package:api_exe/presentation/pixabay/pixabay_ui_event.dart';
import 'package:flutter/material.dart';

class PhotoViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  PixabayState _state = PixabayState([], false);

  PixabayState get state => _state;

  // 이벤트를 처리하기 위한 stream 기능
  final _eventController = StreamController<PixabayUiEvent>();
  Stream<PixabayUiEvent> get eventStream => _eventController.stream;

  PhotoViewModel(this.getPhotosUseCase);

  Future<void> fetchPhoto(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Pixabay>> result = await getPhotosUseCase.execute(query);

    // 상태가 변하는 타이밍
    result.when(
      success: (pixabays) {
        _state = state.copyWith(pixabays: pixabays);
        notifyListeners();
      },
      error: (message) {
        _eventController.add(PixabayUiEvent.showSnackBar(message));
      },
    );
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}

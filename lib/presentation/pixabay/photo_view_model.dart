import 'dart:async';

import 'package:api_exe/data/data_source/result.dart';
import 'package:api_exe/domain/model/pixabay.dart';
import 'package:api_exe/domain/use_case/get_photos_use_case.dart';
import 'package:api_exe/presentation/pixabay/pixabay_state.dart';
import 'package:api_exe/presentation/pixabay/pixabay_ui_event.dart';
import 'package:flutter/material.dart';

class PhotoViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  // 데이터 변수의(pixabay[])? 상태 관리
  PixabayState _state = PixabayState([], false);
  PixabayState get state => _state;

  // 이벤트를 처리하기 위한 stream 기능 사용
  final _eventController = StreamController<PixabayUiEvent>();
  Stream<PixabayUiEvent> get eventStream => _eventController.stream;

  PhotoViewModel(this.getPhotosUseCase);

  Future<void> fetchPhoto(String query) async {
    // 이미지 데이터 전송 성공하면 화면 갱신
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    // use case를 이용해서 이미지 검색 결과 불어옴
    final Result<List<Pixabay>> result = await getPhotosUseCase(query);

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

    // 이미지 데이터 전송이 실패하면....
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}

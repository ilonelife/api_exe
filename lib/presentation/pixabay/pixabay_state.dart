import 'package:api_exe/domain/model/pixabay.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay_state.freezed.dart';
part 'pixabay_state.g.dart';

// copyWith, 불변객체 기능 제공
@freezed
class PixabayState with _$PixabayState {
  factory PixabayState(
    List<Pixabay> pixabays,
    bool isLoading,
  ) = _PixabayState;

  factory PixabayState.fromJson(Map<String, dynamic> json) =>
      _$PixabayStateFromJson(json);
}

/* 수동으로 state 클래스 만듦
class PixabayState {
  final List<Pixabay> pixabays;
  final bool isLoading;

  PixabayState(this.pixabays, this.isLoading);

  // 변수를 final로 만들었기 때문에, 수정이 필요할 경우 copy 함수 제공...
  PixabayState copy({List<Pixabay>? pixabays, bool? isLoading}) {
    return PixabayState(
      pixabays ?? this.pixabays,
      isLoading ?? this.isLoading,
    );
  }
}
*/

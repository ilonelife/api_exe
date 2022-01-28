import 'package:api_exe/domain/model/pixabay.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay_state.freezed.dart';
part 'pixabay_state.g.dart';

@freezed
class PixabayState with _$PixabayState {
  factory PixabayState(
    List<Pixabay> pixabays,
    bool isLoading,
  ) = _PixabayState;

  factory PixabayState.fromJson(Map<String, dynamic> json) =>
      _$PixabayStateFromJson(json);
}

/*
class PixabayState {
  final List<Pixabay> pixabays;
  final bool isLoading;

  PixabayState(this.pixabays, this.isLoading);

  PixabayState copy({List<Pixabay>? pixabays, bool? isLoading}) {
    return PixabayState(
      pixabays ?? this.pixabays,
      isLoading ?? this.isLoading,
    );
  }
}
*/

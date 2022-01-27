import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay_ui_event.freezed.dart';

@freezed
abstract class PixabayUiEvent<T> with _$PixabayUiEvent<T> {
  const factory PixabayUiEvent.showSnackBar(String message) = ShowSnackBar;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(String e) = Error;
}

// flutter pub run build_runner build

/*  수동으로 직접 작성한 코드( 봉인 클래스, sealed classes )
    위는 코드 제너레이션을 이용함
abstract class Result<T> {
  factory Result.success(T data) = Success;
  factory Result.error(String message) = Error;
}

class Success<T> implements Result<T> {
  final T data;
  Success(this.data);
}

class Error<T> implements Result<T> {
  final String message;
  Error(this.message);
}
*/

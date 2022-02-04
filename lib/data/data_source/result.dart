import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/*
  Pixabay API 통신 결과를 처리하는 추상 클래스
  freezed 외부 라이브러리를 이용한 봉인 클래스(sealed classes)
 */
@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(String e) = Error;
}

/*  수동으로 작성한 에러 처리 코드

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

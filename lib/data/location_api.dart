import 'package:geolocator/geolocator.dart';

// 현재 위치에 대한 위도/경도 등의 정보를 가져온다
class LocationApi {
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}

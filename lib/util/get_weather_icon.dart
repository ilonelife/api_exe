import 'package:flutter/material.dart';

Image getWeatherIcon(String _icon) {
  String path = 'assets/icons/';
  String imageExtention = '.png';
  return Image.asset(
    path + _icon + imageExtention,
    width: 70,
    height: 70,
  );
}

Image getWeatherIconSmall(String _icon) {
  String path = 'assets/icons/';
  String imageExtention = '.png';
  return Image.asset(
    path + _icon + imageExtention,
    width: 40,
    height: 40,
  );
}

class OneCall {
  OneCall({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
  });

  late final double lat;
  late final double lon;
  late final String timezone;
  late final int timezoneOffset;
  late final Current current;
  late final List<Minutely> minutely;
  late final List<Hourly> hourly;
  late final List<Daily> daily;

  factory OneCall.fromJson(Map<String, dynamic> json) {
    return OneCall(
        lat: json['lat'],
        lon: json['lon'],
        timezone: json['timezone'],
        timezoneOffset: json['timezone_offset'],
        current: Current.fromJson(json['current']),
        minutely: List.from(json['minutely'])
            .map((e) => Minutely.fromJson(e))
            .toList(),
        hourly:
            List.from(json['hourly']).map((e) => Hourly.fromJson(e)).toList(),
        daily: List.from(json['daily']).map((e) => Daily.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['timezone'] = timezone;
    _data['timezone_offset'] = timezoneOffset;
    _data['current'] = current.toJson();
    _data['minutely'] = minutely.map((e) => e.toJson()).toList();
    _data['hourly'] = hourly.map((e) => e.toJson()).toList();
    _data['daily'] = daily.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });

  late final int dt;
  late final int sunrise;
  late final int sunset;
  late final num temp;
  late final num feelsLike;
  late final int pressure;
  late final int humidity;
  late final double dewPoint;
  late final num uvi;
  late final int clouds;
  late final int visibility;
  late final double windSpeed;
  late final int windDeg;
  late final double? windGust;
  late final List<Weather> weather;

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
        dt: json['dt'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        temp: json['temp'],
        feelsLike: json['feels_like'],
        pressure: json['pressure'],
        humidity: json['humidity'],
        dewPoint: json['dew_point'],
        uvi: json['uvi'],
        clouds: json['clouds'],
        visibility: json['visibility'],
        windSpeed: json['wind_speed'],
        windDeg: json['wind_deg'],
        windGust: json['wind_gust'],
        weather: List.from(json['weather'])
            .map((e) => Weather.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['uvi'] = uvi;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  late final int id;
  late final String main;
  late final dynamic description;
  late final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Minutely {
  Minutely({
    required this.dt,
    required this.precipitation,
  });

  late final int dt;
  late final int precipitation;

  factory Minutely.fromJson(Map<String, dynamic> json) {
    return Minutely(dt: json['dt'], precipitation: json['precipitation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['precipitation'] = precipitation;
    return _data;
  }
}

class Hourly {
  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });

  late final int dt;
  late final num temp;
  late final num feelsLike;
  late final int pressure;
  late final int humidity;
  late final num dewPoint;
  late final num uvi;
  late final int clouds;
  late final int visibility;
  late final num windSpeed;
  late final int windDeg;
  late final double windGust;
  late final List<Weather> weather;
  late final num pop;

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
        dt: json['dt'],
        temp: json['temp'],
        feelsLike: json['feels_like'],
        pressure: json['pressure'],
        humidity: json['humidity'],
        dewPoint: json['dew_point'],
        uvi: json['uvi'],
        clouds: json['clouds'],
        visibility: json['visibility'],
        windSpeed: json['wind_speed'],
        windDeg: json['wind_deg'],
        windGust: json['wind_gust'],
        weather:
            List.from(json['weather']).map((e) => Weather.fromJson(e)).toList(),
        pop: json['pop']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['uvi'] = uvi;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['pop'] = pop;
    return _data;
  }
}

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  });

  late final int dt;
  late final int sunrise;
  late final int sunset;
  late final int moonrise;
  late final int moonset;
  late final num moonPhase;
  late final Temp temp;
  late final FeelsLike feelsLike;
  late final int pressure;
  late final int humidity;
  late final double dewPoint;
  late final double windSpeed;
  late final int windDeg;
  late final double windGust;
  late final List<Weather> weather;
  late final int clouds;
  late final num pop;
  late final num uvi;

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
        dt: json['dt'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        moonrise: json['moonrise'],
        moonset: json['moonset'],
        moonPhase: json['moon_phase'],
        temp: Temp.fromJson(json['temp']),
        feelsLike: FeelsLike.fromJson(json['feels_like']),
        pressure: json['pressure'],
        humidity: json['humidity'],
        dewPoint: json['dew_point'],
        windSpeed: json['wind_speed'] / 1,
        windDeg: json['wind_deg'],
        windGust: json['wind_gust'],
        weather:
            List.from(json['weather']).map((e) => Weather.fromJson(e)).toList(),
        clouds: json['clouds'],
        pop: json['pop'],
        uvi: json['uvi']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['moonrise'] = moonrise;
    _data['moonset'] = moonset;
    _data['moon_phase'] = moonPhase;
    _data['temp'] = temp.toJson();
    _data['feels_like'] = feelsLike.toJson();
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['clouds'] = clouds;
    _data['pop'] = pop;
    _data['uvi'] = uvi;
    return _data;
  }
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  late final double day;
  late final num min;
  late final num max;
  late final num night;
  late final num eve;
  late final num morn;

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
        day: json['day'],
        min: json['min'],
        max: json['max'],
        night: json['night'],
        eve: json['eve'],
        morn: json['morn']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['min'] = min;
    _data['max'] = max;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  late final double day;
  late final num night;
  late final double eve;
  late final num morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    return FeelsLike(
        day: json['day'],
        night: json['night'],
        eve: json['eve'],
        morn: json['morn']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}

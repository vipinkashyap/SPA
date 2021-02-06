// To parse this JSON data, do
// Generated from https://app.quicktype.io/
// Usage : final oneCallWeather = oneCallWeatherFromJson(jsonString);

import 'dart:convert';

OneCallWeather oneCallWeatherFromJson(String str) => OneCallWeather.fromJson(json.decode(str));

String oneCallWeatherToJson(OneCallWeather data) => json.encode(data.toJson());

class OneCallWeather {
    OneCallWeather({
        this.lat,
        this.lon,
        this.timezone,
        this.timezoneOffset,
        this.current,
        this.daily,
    });

    double lat;
    double lon;
    String timezone;
    int timezoneOffset;
    Current current;
    List<Daily> daily;

    factory OneCallWeather.fromJson(Map<String, dynamic> json) => OneCallWeather(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromJson(json["current"]),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toJson(),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
    };
}

class Current {
    Current({
        this.dt,
        this.sunrise,
        this.sunset,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.uvi,
        this.clouds,
        this.visibility,
        this.windSpeed,
        this.windDeg,
        this.weather,
    });

    int dt;
    int sunrise;
    int sunset;
    double temp;
    double feelsLike;
    int pressure;
    int humidity;
    double dewPoint;
    int uvi;
    int clouds;
    int visibility;
    double windSpeed;
    int windDeg;
    List<Weather> weather;

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"],
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    };
}

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int id;
    String main;
    String description;
    String icon;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}

class Daily {
    Daily({
        this.dt,
        this.sunrise,
        this.sunset,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.windSpeed,
        this.windDeg,
        this.weather,
        this.clouds,
        this.pop,
        this.uvi,
    });

    int dt;
    int sunrise;
    int sunset;
    Temp temp;
    FeelsLike feelsLike;
    int pressure;
    int humidity;
    double dewPoint;
    double windSpeed;
    int windDeg;
    List<Weather> weather;
    int clouds;
    double pop;
    double uvi;

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        uvi: json["uvi"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp.toJson(),
        "feels_like": feelsLike.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
    };
}

class FeelsLike {
    FeelsLike({
        this.day,
        this.night,
        this.eve,
        this.morn,
    });

    double day;
    double night;
    double eve;
    double morn;

    factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

class Temp {
    Temp({
        this.day,
        this.min,
        this.max,
        this.night,
        this.eve,
        this.morn,
    });

    double day;
    double min;
    double max;
    double night;
    double eve;
    double morn;

    factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

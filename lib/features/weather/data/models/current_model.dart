import 'package:weather_app/features/weather/data/models/condition_model.dart';
import 'package:weather_app/features/weather/domain/entities/current.dart';

class CurrentModel extends Current {
  const CurrentModel({
    required super.tempC,
    required super.condition,
    required super.feelsLikeC,
    required super.humidity,
    required super.pressureMb,
    required super.uv,
    required super.windKph,
    required super.lastUpdated,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      tempC: json['temp_c'],
      condition: ConditionModel.fromJson(json['condition']),
      feelsLikeC: json['feelslike_c'],
      humidity: json['humidity'],
      pressureMb: json['pressure_mb'],
      uv: json['uv'],
      windKph: json['wind_kph'],
      lastUpdated: DateTime.parse(json['last_updated']),
    );
  }
}

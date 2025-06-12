import 'package:weather_app/features/weather/data/models/condition_model.dart';
import 'package:weather_app/features/weather/domain/entities/hour.dart';

class HourModel extends Hour {
  const HourModel({
    required super.tempC,
    required super.condition,
    required super.time,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) {
    return HourModel(
      tempC: json['temp_c'],
      condition: ConditionModel.fromJson(json['condition']),
      time: DateTime.parse(json['time']),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/condition.dart';

class Current extends Equatable {
  final num tempC;
  final Condition condition;
  final num feelsLikeC;
  final num humidity;
  final num pressureMb;
  final num uv;
  final num windKph;
  final DateTime lastUpdated;

  const Current({
    required this.tempC,
    required this.condition,
    required this.feelsLikeC,
    required this.humidity,
    required this.pressureMb,
    required this.uv,
    required this.windKph,
    required this.lastUpdated
  });

  @override
  List<Object?> get props => [
    tempC,
    condition,
    feelsLikeC,
    humidity,
    pressureMb,
    uv,
    windKph,
    lastUpdated,
  ];
}

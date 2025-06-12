import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/condition.dart';

class Hour extends Equatable {
  final num tempC;
  final Condition condition;
  final DateTime time;

  const Hour({
    required this.tempC,
    required this.condition,
    required this.time,
  });

  @override
  List<Object?> get props => [
    tempC,
    condition,
    time,
  ];
}

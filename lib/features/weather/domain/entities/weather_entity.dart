import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/current.dart';
import 'package:weather_app/features/weather/domain/entities/forecast.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';

class WeatherEntity extends Equatable {
  final Location location;
  final Current current;
  final Forecast forecast;


  const WeatherEntity({
    required this.location,
    required this.current,
    required this.forecast
  });

  @override
  List<Object?> get props => [
    location,
    current,
    forecast,
  ];
}

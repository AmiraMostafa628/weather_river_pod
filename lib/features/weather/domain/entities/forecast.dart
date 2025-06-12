import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/astro.dart';
import 'package:weather_app/features/weather/domain/entities/day.dart';
import 'package:weather_app/features/weather/domain/entities/hour.dart';

class Forecast extends Equatable {
  final List<ForecastDay> forecastDays;

  const Forecast({
    required this.forecastDays,
  });

  @override
  List<Object?> get props => [
    forecastDays,
  ];
}

class ForecastDay extends Equatable {
  final DateTime date;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  const ForecastDay({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  @override
  List<Object?> get props => [
    date,
    day,
    astro,
    hour,
  ];
}

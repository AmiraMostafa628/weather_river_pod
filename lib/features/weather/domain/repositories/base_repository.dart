import 'package:dartz/dartz.dart';
import 'package:weather_app/core/connection/failure.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

abstract class BaseRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherData(String country);
}
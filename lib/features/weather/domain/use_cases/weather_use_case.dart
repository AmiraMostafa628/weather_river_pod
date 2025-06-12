import 'package:dartz/dartz.dart';
import 'package:weather_app/core/base_use_case/base_use_case.dart';
import 'package:weather_app/core/connection/failure.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/domain/repositories/base_repository.dart';

class WeatherUseCase extends BaseUseCase<WeatherEntity, String> {
  final BaseRepository baseRepository;

   WeatherUseCase({required this.baseRepository});

  @override
  Future<Either<Failure, WeatherEntity>> call(String param) async {
    return await baseRepository.getWeatherData(param);
  }
}

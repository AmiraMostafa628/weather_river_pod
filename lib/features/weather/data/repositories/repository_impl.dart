import 'package:dartz/dartz.dart';
import 'package:weather_app/core/connection/failure.dart';
import 'package:weather_app/features/weather/data/data_sources/remote_data_source.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/domain/repositories/base_repository.dart';

class RepositoryImpl extends BaseRepository {

  final RemoteDataSource remoteDataSource;
  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherData(String country) async{
    try{
      final result = await remoteDataSource.getWeatherData(country);
      return Right(result);

    }catch(error){
      return Left(
        ServerFailure(message: error.toString())
      );
    }
  }
}

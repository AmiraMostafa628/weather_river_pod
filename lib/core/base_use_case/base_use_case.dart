import 'package:dartz/dartz.dart';
import 'package:weather_app/core/connection/failure.dart';

abstract class BaseUseCase<T,Param>{
  Future<Either<Failure,T>> call(Param param);

}
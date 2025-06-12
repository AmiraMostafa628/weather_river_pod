import 'package:get_it/get_it.dart';
import 'package:weather_app/core/api/api_client.dart';
import 'package:weather_app/features/weather/data/data_sources/remote_data_source.dart';
import 'package:weather_app/features/weather/data/repositories/repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/base_repository.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init(){
    sl.registerLazySingleton(() => ApiClient());

    sl.registerLazySingleton(
      () => RemoteDataSource(apiClient: sl()),
    );
    sl.registerLazySingleton<BaseRepository>(
      () => RepositoryImpl(remoteDataSource: sl()),
    );
    sl.registerLazySingleton(() => WeatherUseCase(baseRepository: sl()));
  }
}

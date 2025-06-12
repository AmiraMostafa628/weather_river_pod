import 'package:weather_app/core/api/api_client.dart';
import 'package:weather_app/core/api/api_constance.dart';
import 'package:weather_app/core/connection/failure.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherData(String country);
}

class RemoteDataSource extends BaseRemoteDataSource {
  ApiClient apiClient;

  RemoteDataSource({required this.apiClient});

  @override
  Future<WeatherModel> getWeatherData(String country) async {
    try {
      final result = await apiClient.getData(
          path: ApiConstants.forecast,
          query:{
            'q':country,
            'days':'3',
          }
      );
      return WeatherModel.fromJson(result.data);
    }catch(e){
      throw ServerFailure(message: e.toString());

    }
  }

}
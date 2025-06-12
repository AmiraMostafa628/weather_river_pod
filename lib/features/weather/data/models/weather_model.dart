import 'package:weather_app/features/weather/data/models/current_model.dart';
import 'package:weather_app/features/weather/data/models/forecast_model.dart';
import 'package:weather_app/features/weather/data/models/location_model.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
 const WeatherModel({
    required super.location,
    required super.current,
    required super.forecast,
  });
 
 factory WeatherModel.fromJson(Map<String,dynamic> json){
   return WeatherModel(
       location:LocationModel.fromJson(json['location']),
       current: CurrentModel.fromJson(json['current']),
       forecast: ForecastModel.fromJson(json['forecast']),
   );
 }
}

import 'package:weather_app/features/weather/domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({required super.name,required super.region});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        name: json['name'],
        region: json['region'],
    );
  }


}
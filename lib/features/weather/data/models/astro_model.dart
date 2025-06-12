import 'package:weather_app/features/weather/domain/entities/astro.dart';

class AstroModel extends Astro {
  const AstroModel({
    required super.sunrise,
    required super.sunset,
  });

  factory AstroModel.fromJson(Map<String,dynamic> json){
    return AstroModel(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

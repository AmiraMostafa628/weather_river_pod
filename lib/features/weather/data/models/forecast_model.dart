import 'package:weather_app/features/weather/data/models/astro_model.dart';
import 'package:weather_app/features/weather/data/models/day_model.dart';
import 'package:weather_app/features/weather/data/models/hour_model.dart';
import 'package:weather_app/features/weather/domain/entities/forecast.dart';

class ForecastModel extends Forecast {
  const ForecastModel({required super.forecastDays});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      forecastDays: List<ForecastDayModel>.from(
        json['forecastday'].map((e) => ForecastDayModel.fromJson(e)),
      ),
    );
  }
}

class ForecastDayModel extends ForecastDay {
  const ForecastDayModel({
    required super.date,
    required super.day,
    required super.astro,
    required super.hour,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: DateTime.parse(json['date']),
      day: DayModel.fromJson(json['day']),
      astro: AstroModel.fromJson(json['astro']),
      hour: List<HourModel>.from(json['hour'].map((e) => HourModel.fromJson(e))),
    );
  }
}

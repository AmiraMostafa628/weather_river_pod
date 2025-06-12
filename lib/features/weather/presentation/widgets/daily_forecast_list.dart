import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/presentation/widgets/daily_forecast_item_builder.dart';

class DailyForecastList extends StatelessWidget {
  const DailyForecastList({super.key, required this.dataEntity});
  final WeatherEntity dataEntity;


  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList.separated(
        itemCount: dataEntity.forecast.forecastDays.length,
        itemBuilder: (context, index) {
          return DailyForecastItemBuilder(
            forecastDay: dataEntity.forecast.forecastDays[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10.0),
      ),
    );
  }
}

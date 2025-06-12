import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'hourly_forecast_item_builder.dart';

class HourlyForecastList extends StatelessWidget {
  const HourlyForecastList({super.key, required this.dataEntity});

  final WeatherEntity dataEntity;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
              spacing: 15.0,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Icon(FontAwesomeIcons.spinner),
                ),
                Text(
                  'Hourly Forecast',
                  style: textTheme.titleLarge,
                ),
              ]),
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: dataEntity.forecast.forecastDays[0].hour.length,
              itemBuilder: (context, index) {
                return HourlyForecastItemBuilder(item: dataEntity.forecast.forecastDays[0].hour[index]);
              },
              separatorBuilder: (context, index) => SizedBox(width: 5.0),
            ),
          ),
        ],
      ),
    );
  }
}


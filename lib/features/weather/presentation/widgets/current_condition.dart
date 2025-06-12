import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/presentation/widgets/current_condition_item_builder.dart';
import 'package:weather_app/features/weather/presentation/widgets/current_condition_object.dart';

class CurrentCondition extends StatelessWidget {
  const CurrentCondition({super.key,required this.dataEntity});
  final WeatherEntity dataEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        spacing: 20.0,
        children: [
          Row(
            spacing: 10.0,
            children: [
              CurrentConditionItem(
                item: CurrentConditionObject(
                  title: "Humidity",
                  subTitle: "${dataEntity.current.humidity} %",
                  icon: Icons.water_drop,
                ),
              ),
              CurrentConditionItem(
                item: CurrentConditionObject(
                  title: "Wind",
                  subTitle: "${dataEntity.current.windKph} Kph/h",
                  icon: Icons.wind_power,
                ),
              ),
            ],
          ),
          Row(
            spacing: 10.0,
            children: [
              CurrentConditionItem(
                item: CurrentConditionObject(
                  title: "Pressure",
                  subTitle: "${dataEntity.current.pressureMb} MBar",
                  icon: Icons.water,
                ),
              ),
              CurrentConditionItem(
                item: CurrentConditionObject(
                  title: "UV",
                  subTitle: dataEntity.current.uv.toString(),
                  icon: Icons.sunny,
                ),
              ),

            ],
          ),
          Row(
            spacing: 10.0,
            children: [
              CurrentConditionItem(
                item: CurrentConditionObject(
                  title: "Sunrise",
                  subTitle: dataEntity.forecast.forecastDays[0].astro.sunrise,
                  icon: Icons.sunny,
                ),
              ),
              CurrentConditionItem(
                item: CurrentConditionObject(
                  title: "Sunset",
                  subTitle: dataEntity.forecast.forecastDays[0].astro.sunset,
                  icon: Icons.sunny_snowing,
                ),
              ),



            ],
          ),
        ],
      ),
    );
  }
}


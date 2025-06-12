import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/domain/entities/forecast.dart';

class DailyForecastItemBuilder extends StatelessWidget {
  const DailyForecastItemBuilder({super.key, required this.forecastDay});

  final ForecastDay forecastDay;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          forecastDay.date.day == DateTime.now().day
              ? Text("Today", style: textTheme.titleMedium)
              : Text(
                  DateFormat.MMMd().format(forecastDay.date),
                  style: textTheme.titleMedium,
                ),
          CachedNetworkImage(
            imageUrl: "https:${forecastDay.day.condition.icon}",
            fit: BoxFit.cover,
            placeholder:(context,url)=> SizedBox(
              width: 70,
              height: 70,
            ),
            errorWidget: (context,url,error)=>CircleAvatar(
              radius: 35,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: Icon(FontAwesomeIcons.exclamation,color: Colors.red,),
            ),
          ),

          Row(
            spacing: 7.0,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    '${forecastDay.day.maxTempC.round()}',
                    style: textTheme.bodyLarge,
                  ),
                  Positioned(
                    right: -12,
                    top: -4,
                    child: Text(
                      '°',
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: 27,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    '/ ${forecastDay.day.minTempC.round()}',
                    style: textTheme.bodyLarge,
                  ),
                  Positioned(
                    right: -12,
                    top: -4,
                    child: Text(
                      '°',
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: 27,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

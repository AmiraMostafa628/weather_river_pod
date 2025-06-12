import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/resources/assets_manager.dart';
import 'package:weather_app/core/resources/color_manager.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.dataEntity});

  final WeatherEntity dataEntity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
        image: DecorationImage(
          image: AssetImage(AssetsManager.home),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        '${dataEntity.current.tempC.round()}',
                        style: textTheme.displayLarge!.copyWith(
                          color: ColorManager.whiteColor,
                          fontSize: 70,
                        ),
                      ),
                       Positioned(
                        right: -22,
                        top: -10,
                        child: Text(
                          '°',
                          style: textTheme.displayLarge!.copyWith(
                            color: ColorManager.whiteColor,
                            fontSize: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                       AssetsManager.currentIcon,
                        height: 90,
                        width: 90,
                      ),
                      Text(
                        dataEntity.current.condition.text,
                        style: textTheme.bodyLarge!.copyWith(
                          color: ColorManager.whiteColor,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Feels Like: ',
                  style: textTheme.bodyLarge!.copyWith(
                    color: ColorManager.whiteColor,
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      '${dataEntity.current.feelsLikeC.round()}',
                      style: textTheme.bodyLarge!.copyWith(
                        color: ColorManager.whiteColor,

                      ),
                    ),
                    Positioned(
                      right: -12,
                      top: -10,
                      child: Text(
                        '°',
                        style: textTheme.bodyLarge!.copyWith(
                          color: ColorManager.whiteColor,
                          fontSize: 30
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                 "Last Updated: ${DateFormat.MMMd().add_jm().format(dataEntity.current.lastUpdated)}",
                style: textTheme.bodySmall!.copyWith(
                  color: Colors.white70,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

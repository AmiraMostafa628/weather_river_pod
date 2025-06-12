import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/domain/entities/hour.dart';

class HourlyForecastItemBuilder extends StatelessWidget {
  const HourlyForecastItemBuilder({super.key, required this.item});

  final Hour item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text('${item.tempC.round()}', style: textTheme.bodyLarge),
            Positioned(
              right: -12,
              top: -4,
              child: Text(
                '°',
                style: textTheme.bodyLarge!.copyWith(fontSize: 30, height: 1),
              ),
            ),
          ],
        ),
        CachedNetworkImage(
          imageUrl: "https:${item.condition.icon}",
          width: 70,
          height: 62,
          fit: BoxFit.cover,
          placeholder:(context,url)=> SizedBox(
            width: 70,
            height: 62,
          ),
          errorWidget: (context,url,error)=>CircleAvatar(
           radius: 35,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Icon(FontAwesomeIcons.exclamation,color: Colors.red,),
          ),
        ),
        Text(DateFormat.j().format(item.time)),
      ],
    );
  }
}

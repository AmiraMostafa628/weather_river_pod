import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/widgets/current_condition_object.dart';

class CurrentConditionItem extends StatelessWidget {
  const CurrentConditionItem({super.key, required this.item});

  final CurrentConditionObject item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Icon(item.icon),
          ),
          title: Text(
            item.title,
            style: textTheme.titleMedium,
          ),
          subtitle: Text(
              item.subTitle,
              style: textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}

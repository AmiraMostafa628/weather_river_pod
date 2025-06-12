import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/resources/color_manager.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/presentation/manager/theme_notifier.dart';
import 'package:weather_app/features/weather/presentation/pages/search/search_view.dart';
import 'package:weather_app/features/weather/presentation/widgets/custom_app_bar.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_forecast_list.dart';
import 'package:weather_app/features/weather/presentation/widgets/current_condition.dart';
import 'package:weather_app/features/weather/presentation/widgets/daily_forecast_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.data});
  final WeatherEntity data;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_,notifier,_) {
        bool isLight = Theme.of(context).brightness == Brightness.light;
        final theme = notifier.read(themeProvider);
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              leading: Icon(
                Icons.location_on_outlined,
                color: ColorManager.whiteColor,
              ),
              title: Text(
                '${data.location.name},${data.location.region}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.whiteColor,
                  fontSize: 18,),
              ),
              actions: [
                IconButton(
                  onPressed:theme.changeThemeMode,
                  icon: Icon(
                    isLight ? Icons.dark_mode : Icons.light_mode,
                    color: ColorManager.whiteColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SearchView()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: ColorManager.whiteColor,
                    ),
                  ),
                ),
              ],
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top,
                  ),
                  child: CustomAppBar(dataEntity: data),
                ),
              ),
            ),
            SliverToBoxAdapter(child: HourlyForecastList(dataEntity: data)),
            SliverPadding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "3-day forecast",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            DailyForecastList(dataEntity: data),
            SliverPadding(
              padding: EdgeInsets.all(20.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Current Conditions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 40.0),
              sliver: SliverToBoxAdapter(child: CurrentCondition(dataEntity: data)),
            ),
          ],
        );
      }
    );
  }
}

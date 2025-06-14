import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/enum/request_status.dart';
import 'package:weather_app/core/resources/assets_manager.dart';
import 'package:weather_app/features/weather/presentation/manager/weather_notifier.dart';
import 'package:weather_app/features/weather/presentation/pages/home/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.isSearch = false, this.cityName});

  final bool isSearch;
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (_, notifier, _) {
          WeatherNotifier weather = isSearch
              ? notifier.watch(weatherProvider(cityName!))
              : notifier.watch(weatherProvider(''));
          switch (weather.status) {
            case RequestStatus.loading:
              return Center(child: CircularProgressIndicator());
            case RequestStatus.loaded:
              return HomeViewBody(data: weather.weatherEntity!);
            case RequestStatus.error:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      AssetsManager.error,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "Error Location ",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

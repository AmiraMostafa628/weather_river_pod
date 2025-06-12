import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/enum/request_status.dart';
import 'package:weather_app/core/services/services_locator.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_use_case.dart';
import 'package:weather_app/features/weather/presentation/manager/city_location.dart';

final weatherProvider = ChangeNotifierProvider.autoDispose.family<WeatherNotifier,String>((ref,cityName){
    final city = cityName != '' ? cityName: ref.watch(currentLocationProvider).currentAddress;
    return WeatherNotifier(sl(), city);
  },
);

class WeatherNotifier extends ChangeNotifier {
  final WeatherUseCase weatherUseCase;
  final dynamic cityName;

  WeatherNotifier(this.weatherUseCase, this.cityName){
    getWeatherData();
  }

  RequestStatus _statue = RequestStatus.loading;
  RequestStatus get status => _statue;

  WeatherEntity? _weatherEntity;
  WeatherEntity? get weatherEntity => _weatherEntity;

  void getWeatherData() async {
    _statue = RequestStatus.loading;
   if(cityName != null)
     {
       final result = cityName == 'Samannoud City' ?
       await weatherUseCase.call('Samannud') : await weatherUseCase.call(cityName);
       result.fold((failure){
         log("error message ${failure.toString()}");
         _statue = RequestStatus.error;

       },(data){
         _weatherEntity = data;
         _statue = RequestStatus.loaded;
       });
     }
    notifyListeners();
  }
}

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

final currentLocationProvider = ChangeNotifierProvider<CurrentAddressNotifier>(
      (ref) => CurrentAddressNotifier()
);

class CurrentAddressNotifier extends ChangeNotifier{
  CurrentAddressNotifier(){
    getCurrentLocation();
  }
  FutureOr<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    try {
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        final locationPosition = await Geolocator.getCurrentPosition();
         await getCurrentLocationFromLatLang(locationPosition);
      } else{
        return Future.error('Location permissions are denied');
      }
    } catch (e) {
      log("error message ${e.toString()}");
      rethrow;
    }
    notifyListeners();
  }

  String? currentAddress;

  FutureOr<void> getCurrentLocationFromLatLang(Position position)async{
    try{
      List<Placemark> place = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark? address  = place[0];
      currentAddress = address.locality;
    }catch(e){
      log("error message ${e.toString()}");
      rethrow;
    }
    notifyListeners();

  }
}

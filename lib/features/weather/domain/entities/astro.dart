import 'package:equatable/equatable.dart';

class Astro extends Equatable {
  final String sunrise;
  final String sunset;


  const Astro({
    required this.sunrise,
    required this.sunset,
  });



@override
  List<Object?> get props => [
    sunrise,
    sunset,
  ];


}

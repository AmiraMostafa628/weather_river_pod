import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String region;

 const Location({
    required this.name,
    required this.region,
  });

  @override
  List<Object?> get props =>[
    name,
    region,
  ];
}
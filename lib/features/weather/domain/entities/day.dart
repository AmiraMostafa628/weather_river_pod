import 'package:equatable/equatable.dart';

import 'condition.dart';

class Day extends Equatable {
  final double maxTempC;
  final double minTempC;
  final Condition condition;

  const Day({
    required this.maxTempC,
    required this.minTempC,
    required this.condition,
  });

  @override
  List<Object?> get props => [
   maxTempC,
   minTempC,
   condition,

  ];
}

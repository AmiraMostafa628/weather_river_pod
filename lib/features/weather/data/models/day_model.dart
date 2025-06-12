import 'package:weather_app/features/weather/data/models/condition_model.dart';
import 'package:weather_app/features/weather/domain/entities/day.dart';

class DayModel extends Day {
  const DayModel({
    required super.maxTempC,
    required super.minTempC,
    required super.condition,
  });

  factory DayModel.fromJson(Map<String,dynamic> json){
   return DayModel(
     maxTempC: json['maxtemp_c'],
     minTempC: json['mintemp_c'],
     condition: ConditionModel.fromJson(json['condition'])
   );
  }
}

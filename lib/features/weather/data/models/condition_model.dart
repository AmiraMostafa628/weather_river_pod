import 'package:weather_app/features/weather/domain/entities/condition.dart';

class ConditionModel extends Condition {

  const ConditionModel({
    required super.text,
    required super.icon,
  });

  factory ConditionModel.fromJson(Map<String,dynamic>json){
    return ConditionModel(
        text: json['text'],
        icon: json['icon'],
    );
  }
}

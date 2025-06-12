import 'package:equatable/equatable.dart';

class Condition extends Equatable {
  final String text;
  final String icon;

  const Condition({
    required this.text,
    required this.icon,
  });

  @override
  List<Object?> get props => [
    text,
    icon,
  ];
}

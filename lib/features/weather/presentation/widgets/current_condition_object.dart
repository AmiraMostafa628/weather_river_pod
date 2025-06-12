import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CurrentConditionObject extends Equatable {
  final String title;
  final String subTitle;
  final IconData icon;

  const CurrentConditionObject({
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  @override
  List<Object?> get props => [
    title,
    subTitle,
    icon,
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/services/services_locator.dart';
import 'package:weather_app/features/app_layout/app_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.init();
  runApp(
      ProviderScope(
      child: AppLayout()));
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/services/services_locator.dart';
import 'package:weather_app/features/app_layout/app_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.init();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  dynamic isDark = sharedPreferences.get("isDark") ?? false;
  runApp(ProviderScope(
      child: AppLayout(isDark: isDark,)));
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/resources/theme_manager.dart';
import 'package:weather_app/features/weather/presentation/manager/theme_notifier.dart';
import 'package:weather_app/features/weather/presentation/pages/home/home_view.dart';

class AppLayout extends ConsumerWidget {
  const AppLayout({super.key,required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeProvider).themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomeView(),
    );
  }
}




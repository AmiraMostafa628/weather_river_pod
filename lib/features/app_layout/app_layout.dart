import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/resources/theme_manager.dart';
import 'package:weather_app/features/weather/presentation/manager/theme_notifier.dart';
import 'package:weather_app/features/weather/presentation/pages/home/home_view.dart';

class AppLayout extends ConsumerStatefulWidget {
  const AppLayout({super.key});

  @override
  ConsumerState<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends ConsumerState<AppLayout> {
  late final ThemeNotifier theme;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      theme = ref.read(themeProvider);
      theme.initCache();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeProvider).themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomeView(),
    );
  }
}





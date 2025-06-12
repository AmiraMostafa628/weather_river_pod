import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/core/resources/color_manager.dart';

class AppTheme{
  static final ThemeData lightTheme= ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorManager.lightThemeScaffoldColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.lightThemeContainerColor,
        statusBarBrightness: Brightness.dark
      )
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.lightThemePrimaryColor,
      onPrimary: ColorManager.lightThemePrimaryColor,
      secondary: ColorManager.lightThemeContainerColor,
      onSecondary: Colors.black54,
      primaryContainer: ColorManager.lightThemeContainerColor,
      error: Colors.red,
      onError: Colors.white,
      surface: ColorManager.lightThemeContainerColor,
      onSurface: Colors.black, // color of text
    ),
    useMaterial3: true,


  );

  static final ThemeData darkTheme= ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorManager.darkThemeScaffoldColor,
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.darkThemePrimaryColor,
              statusBarBrightness: Brightness.light

          )
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: ColorManager.whiteColor,
        secondary: ColorManager.darkThemeScaffoldColor,
        surface: ColorManager.darkThemePrimaryColor,
        onSurface: Colors.white,
        onPrimary: ColorManager.whiteColor,
        onSecondary: Colors.white70,
        error: Colors.red,
        onError: Colors.white,
      ),
      useMaterial3: true
  );

}
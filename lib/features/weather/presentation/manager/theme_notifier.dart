import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = ChangeNotifierProvider<ThemeNotifier>((ref)=>ThemeNotifier());

class ThemeNotifier extends ChangeNotifier{

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  bool _isDark = false;
  bool get isDark => _isDark;

  void changeThemeMode({bool? cacheValue}) async{
    if(cacheValue != null){
      _isDark = cacheValue;
    }
    else{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      _isDark = !_isDark;
      sharedPreferences.setBool("isDark", _isDark);
    }
    _themeMode = _isDark? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
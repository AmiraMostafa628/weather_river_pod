import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = ChangeNotifierProvider<ThemeNotifier>((ref)=>ThemeNotifier());

class ThemeNotifier extends ChangeNotifier{

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void initCache() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isDark =  sharedPreferences.getBool("isDark");
    if(isDark !=null){
      _themeMode = isDark? ThemeMode.dark : ThemeMode.light;
    }
    else{
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  void changeThemeMode() async{
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light :ThemeMode.dark;
    bool isDark = _themeMode == ThemeMode.dark;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isDark", isDark);
    notifyListeners();
  }
}
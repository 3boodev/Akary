import 'package:akary/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  ///Themes

  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey.shade300,
    appBarTheme: const AppBarTheme(
      //Control the top bar of ststus system
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.black12,
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: mainColor,
    appBarTheme: const AppBarTheme(
      //Control the top bar of ststus system
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      elevation: 0,
    ),
    dividerColor: Colors.white54,
  );
  final _getStorage = GetStorage();

  final _darkThemeKey = 'isDarkTheme';
  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());
  }
}

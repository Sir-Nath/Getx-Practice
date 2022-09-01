
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController{
  late SharedPreferences prefs;
  //GetStorage & saving of theme is to be able to access the last mode even when app is restarted
  final _box = GetStorage();
  final _key = 'isDarkMode';


  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;


  //we are loading the bool saved and if null return false
  bool _loadTheme() => _box.read(_key) ?? false;


  //we are saving a bool value,
  void saveTheme(bool isDarkMode) {
   _box.write(_key, isDarkMode);
 }

  //these methods can be used to change the theme
  void changeTheme(ThemeData theme) => Get.changeTheme(theme);
  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);


}
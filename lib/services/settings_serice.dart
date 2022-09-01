import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends GetxService{
    //get services can be used for api services, storage services and cache services
    late SharedPreferences _prefs;
    final counter = 0.obs;

    Future<SettingsService> init() async{
        _prefs = await SharedPreferences.getInstance();
        counter.value = (_prefs.getInt('counter') ?? 0);
        return this;
    }

    Future<void> incrementCounter()async{
        counter.value = (_prefs.getInt('counter') ?? 0 )+ 1;
        _prefs.setInt('counter', counter.value);
    }
}
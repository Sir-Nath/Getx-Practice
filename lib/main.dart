import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/services/getx_service.dart';
import 'package:getx_practice/services/settings_serice.dart';
import 'package:getx_practice/themes/themes.dart';
import 'package:getx_practice/themes/themes_controller.dart';
import 'package:getx_practice/views/dependency%20injection/class.dart';
import 'package:getx_practice/views/dependency%20injection/controller.dart';
import 'package:getx_practice/views/dependency%20injection/detail_page.dart';
import 'package:getx_practice/views/dependency%20injection/view.dart';
import 'package:getx_practice/views/navigation%20management/home_page.dart';
import 'package:getx_practice/views/navigation%20management/navigation_next_screen.dart';
import 'package:getx_practice/views/state%20management/counter_app.dart';
import 'package:getx_practice/views/state%20management/simple_state-management.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}
Future<void> initServices() async{
  //initializes the GetStorage Package
  await GetStorage.init();
  SharedPreferences.getInstance();
  //i can put other services here, hive, get_storage and so on
  //this will put the SettingsService in the memory
  await Get.putAsync(() => SettingsService().init());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    //all other project can be access through this
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      //Disposes classes not used and not set to permanent
      // smartManagement: SmartManagement.full,
      //no permission to dispose classes using Get.put and Get.putAsync
      // smartManagement: SmartManagement.onlyBuilder,
      //save in factory, recreate when needed
      // smartManagement: SmartManagement.keepFactory,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        //i used the convention '/route/:id' to assign an id to each route page, it can also accept name
        GetPage(name: '/next/:id', page: () => const NavigationNextScreen()),
        //checkout the button for Get.toNamed to understand why I put this here even though i have the screen above named
        GetPage(name: '/next', page: () => const NavigationNextScreen()),
        GetPage(name: '/counterapp', page: () => const CounterApp()),
        GetPage(
            name: '/counterapp2', page: () => const SimpleStateManagement()),
        GetPage(
          name: '/dependency',
          page: () => DependencyManagement(),
        ),
        GetPage(
          name: '/detail',
          page: () => DetailPage(),
          //i can replace all of this with the DetailsBinding and put all this code in the file
          // binding: DetailsBinding(),
          binding: BindingsBuilder(
            () {
              Get.lazyPut(() => Controller(),
                  //this will keep the controller in memory and not delete it
                  fenix: false
              );
              Get.putAsync<AsyncTask>(()async{
                await Future.delayed(const Duration(seconds: 1));
                return AsyncTask();
              });
              //create a new instance whenever it is called
              //Get.create<Controller>(() => Controller(), permanent: true,);
            },
          ),
        ),
        GetPage(name: '/service', page: () => GetXService()),

      ],
      routingCallback: (routing) {
        if (routing?.current == '/next/1') {
          log('Open Ads');
        }
      },
    );
  }
}

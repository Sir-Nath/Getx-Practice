import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/themes/themes_controller.dart';
import 'package:getx_practice/views/navigation%20management/navigation_next_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final themeController = Get.put<ThemeController>(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation HomePage'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //This add a new screen to the route stack
                  Get.to(() => const NavigationNextScreen(),
                      arguments: 'Get.to method used to push screen',
                      transition: Transition.leftToRight);
                },
                child: const Text('Get.to')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //This add a new screen to the route stack
                  Get.toNamed(
                      //'/next?id=2',
                      '/next',
                      parameters: <String, String>{
                    'id': '5', 'name': 'checkout'
                      },
                      arguments: 'Get.toNamed method used to push screen ');
                },
                child: const Text('Get.toNamed')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //Replace the previous Screen on the route stack
                  Get.off(() => const NavigationNextScreen(),
                      arguments: 'Get.off method used to push screen');
                },
                child: const Text('Get.off')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //Replace the previous Screen on the route stack
                  Get.offNamed('/next/1',
                      arguments: 'Get.toNamed method used to push screen ');
                },
                child: const Text('Get.offNamed')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //Replace the previous Screen on the route stack
                  Get.toNamed('/counterapp',);
                },
                child: const Text('Go to Reactive Counter App')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //Replace the previous Screen on the route stack
                  Get.toNamed('/counterapp2',);
                },
                child: const Text('Go to Simple Counter App')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //Replace the previous Screen on the route stack
                  Get.toNamed('/dependency',);
                },
                child: const Text('Go to Dependency Injection')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //we check for current mode and switch to the other
                    if(Get.isDarkMode){
                      //themeController.changeTheme(Themes.lightTheme);
                      //we change the mode
                      themeController.changeThemeMode(ThemeMode.light);
                      //and save it, false there is saying save not as DarkMode
                      themeController.saveTheme(false);
                    }else{
                      //themeController.changeTheme(Themes.darkTheme);
                      themeController.changeThemeMode(ThemeMode.dark);
                      //false there is saying save not as LightMode
                      themeController.saveTheme(true);
                    }
                },
                child: const Text('change theme')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  //Replace the previous Screen on the route stack
                  Get.toNamed('/service',);
                },
                child: const Text('Go to Service Page')),
          ),
        ],
      ),
    );
  }
}

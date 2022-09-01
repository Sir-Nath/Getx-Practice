import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationNextScreen extends StatelessWidget {
  const NavigationNextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation NextScreen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.back(
                      result: 'Going Back',
                      closeOverlays:
                          false // this is to close things like dialog, bottomSheet ...
                      );
                },
                child: const Text('Get.back')),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(Get.arguments),
          const SizedBox(
            height: 40,
          ),
          Text(Get.parameters['id'] ?? 'Hello'),
          Text(Get.parameters['name'] ?? 'Hello')
        ],
      ),
    );
  }
}

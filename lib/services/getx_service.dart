import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/services/settings_serice.dart';

class GetXService extends StatelessWidget {
  GetXService({Key? key}) : super(key: key);

  final controller = Get.find<SettingsService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get_x Service'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Counter App',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          Center(
            child: Obx(
                  () => Text(
                '${controller.counter}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: (){
                    controller.incrementCounter();
                },
                child: const Text('increase number')),
          ),
        ],
      ),
    );
  }
}

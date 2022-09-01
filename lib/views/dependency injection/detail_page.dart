import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/dependency%20injection/controller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  final controller = Get.find<Controller>();
  //another way to find
  //Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Obx(() => Text(
              '${controller.count.value}',
              style: const TextStyle(fontSize: 28),
            )),
            Spacer(),
            Spacer()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.find<Controller>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

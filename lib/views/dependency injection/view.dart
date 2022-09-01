import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/dependency%20injection/binding.dart';
import 'package:getx_practice/views/dependency%20injection/controller.dart';
import 'package:getx_practice/views/dependency%20injection/detail_page.dart';

class DependencyManagement extends StatelessWidget {
  DependencyManagement({Key? key}) : super(key: key);

  //this provide an instance throughout the app
  //final controller = Get.put(Controller());

  //we use this when we want to assign a tag to dependency when
  //there is more than one instance
  final controller2 = Get.put(
    Controller(),
    tag: 'uniqueId'
  );

  //check out Get.lazyPut in main.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dependency Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Obx(() => Text(
                  '${controller2.count.value}',
                  style: const TextStyle(fontSize: 28),
                )),
            Spacer(),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    //Replace the previous Screen on the route stack
                    Get.toNamed('/detail',);
                    //i can use binding here too for unNamed route
                    // Get.to(
                    //     ()=> DetailPage(),
                    //   binding: DetailsBinding(),
                    // );
                  },
                  child: const Text('Detail Page')),
            ),
            Spacer()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.find<Controller>(tag: 'uniqueId').increment();
          //use this when you tag the dependency
          //Get.find<Controller>(tag: 'uniqueId').increment();
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}

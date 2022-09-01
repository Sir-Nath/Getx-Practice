import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/state%20management/simple_state_controlller.dart';

class SimpleStateManagement extends StatelessWidget {
  const SimpleStateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple State Management'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        const Text(
                          'Simple state Management',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GetBuilder<Controller>(
                          //id: 'count1',
                            init: Controller(),
                            builder: (controller) {
                              return Text(
                                '${Controller.to.counter}',
                                style: const TextStyle(fontSize: 20),
                              );
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Controller.to.increment();
                              },
                              child: const Icon(Icons.add),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Controller.to.decrement();
                                //if we don't use the get to => Get.find() in controller, then i will have
                                //Get.find<Controller>().increment();
                              },
                              child: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        const Text(
                          'Simple state Management for GetX',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GetX<Controller>(
                          init: Controller(),
                            builder: (controller) {
                              return Text(
                                '${controller.count.value}',
                                style: const TextStyle(fontSize: 20),
                              );
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Controller.to.increment();
                              },
                              child: const Icon(Icons.add),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Controller.to.decrement();
                                //if we don't use the get to => Get.find() in controller, then i will have
                                //Get.find<Controller>().increment();
                              },
                              child: const Icon(Icons.remove),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Controller.to.clearCount();
                              },
                              child: const Icon(Icons.refresh),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

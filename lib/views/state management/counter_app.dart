import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/state%20management/reactive_state_management.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive State Management'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              children: [
                const Text('Counter App',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                Center(
                  child: Obx(
                    //if i used count from a controller class, then i will have to inject it into the system;
                    //final controller = Get.put(Controller());
                        () => Text(
                      '${count.value}',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        decrement();
                      },
                      child: const Icon(Icons.remove),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        increment();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 40,),
          SizedBox(
            child: Column(
              children: [
                const Text(
                  'Update User',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Obx(() => Text(
                  '${user.value.name} ${user().age}'
                )),
                ElevatedButton(
                  onPressed: () {
                   toUpper();
                  },
                  child: const Icon(Icons.update_sharp),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          SizedBox(
            child: Column(
              children: [
                const Text(
                  'Update variable in a class',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                Obx(() => Text(
                    '${userTwo.name.value} ${userTwo.age.value}'
                )),
                ElevatedButton(
                  onPressed: () {
                    toUpperClassParameter();
                  },
                  child: const Icon(Icons.update_sharp),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }
}

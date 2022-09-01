import 'dart:developer';

import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get to => Get.find();

  //this is for GetBuilder
  int counter = 0;

  //for GetX
  final count = 0.obs;

  void increment() {
    //use this update for GetBuilder
    // counter++;
    // update();
    //this is for GetX
    count.value++;
  }

  // when using update() in GetBuilder, i can assign unique id to
  //the variables in the GetBuilder in this case count so that i update
  //only that variable in the block
  //instead of just update(), i'll have update([count1])
  //i can also use condition update([count1], condition)
  void decrement() {
    //use this update for GetBuilder
    // counter--;
    // update();
    //this is for GetX
    count.value--;
  }

  void clearCount() {
    count.value = 0;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    log('onInit called');

    //called every time the listener is updated
    //ever(count, (_) => log('$_ change'));

    //called every time all the listeners([]) is updated
    //everAll([count], (_) => log('$_ change'));

    //called once and the first time the listener is changed
    //once(count, (_)=>log('$_ change')$);

    //called every time user stops typing for 1000milliseconds
    //whatever the state of the listener is after the time will be logged
    // debounce(count, (_) => log('$_ debounce'),
    //     time: const Duration(milliseconds: 1000));
//ignore all changes in 1000 milliseconds
//     interval(count, (_) => log('$_ interval'),
//         time: const Duration(milliseconds: 1000));
  }

  //if i stack a page on another page with Get.to which had a controller in it, i can find it in the next page
//if i used Get.off then i will have to put and find on the new page
}

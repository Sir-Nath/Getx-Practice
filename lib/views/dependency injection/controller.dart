import 'dart:developer';

import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get to => Get.find();

  //for GetX
  final count = 0.obs;

  void increment() {
    count.value++;
  }
  void decrement() {
    count.value--;
  }

  void clearCount() {
    count.value = 0;
  }

  @override
  void onClose() {
//just before the controller is deleted
    super.onClose();
  }

  @override
  void onReady() {
    //called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onInit() {
    //called immediately after the widget is allocated memory
    super.onInit();
    log('onInit called');
  }
}

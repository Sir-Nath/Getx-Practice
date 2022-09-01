import 'package:get/get.dart';
import 'package:getx_practice/views/state%20management/simple_state_controlller.dart';

class DetailsBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
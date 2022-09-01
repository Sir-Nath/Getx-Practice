import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/state%20management/user_model.dart';

//there are different ways to declare a variable in reactive state management
//1. Rx(Type)
//2. Rx<Type>
//.obs

final name = RxString('my name');
final name2 = Rx<String>('my second name');
final name3 = 'my third name'.obs;
final user = Rx<User>(User(
  name: 'Peter',
  age: 25
));

final userTwo = UserTwo();
final count = 0.obs;

void increment()=> count.value++;
void decrement()=> count.value--;

void toUpper(){
 user.update((user) {
  user?.name = user.name.toUpperCase();
   user?.age++;
 });
}

void toUpperClassParameter(){
  userTwo.name.value = userTwo.name.value.toUpperCase();
  userTwo.age.value++;
}

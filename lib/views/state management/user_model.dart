import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User {
  String name;
  int age;
  User({
    this.name = '',
    this.age = 0,
  });
}

class UserTwo{
  final name = 'Peter'.obs;
  final age = 21.obs;
}
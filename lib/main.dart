import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/presentation/list_binding.dart';
import 'package:getx_example/presentation/list_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: ListBindings(),
      home: const ListPage(),
    ),
  );
}

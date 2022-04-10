import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/domain/entity/user_detail.dart';
import 'package:getx_example/presentation/detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User detail')),
      body: _contents(),
    );
  }

  Widget _contents() {
    return controller.obx(
      (state) => _detail(state!),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _detail(UserDetail user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/example_face/lego-${user.id}.jpeg'),
            ),
          ),
          _attr('name', user.name),
          _attr('email', user.email),
          _attr('phone', user.phone),
          _attr('city', user.city),
        ],
      ),
    );
  }

  Widget _attr(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 16)),
        Text(label),
        Text(value, style: Get.textTheme.headline5),
      ],
    );
  }
}

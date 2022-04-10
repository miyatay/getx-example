import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/domain/entity/user.dart';
import 'package:getx_example/presentation/detail_page.dart';
import 'package:getx_example/presentation/list_controller.dart';

class ListPage extends GetView<ListController> {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User list')),
      body: _contents(),
    );
  }

  Widget _contents() {
    return controller.obx(
          (state) => _list(state!),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  Widget _list(List<User> users) {
    return ListView(
      children: users.map((user) => _row(user)).toList(),
    );
  }
  Widget _row(User user) {
    return ListTile(
      leading: Image(image: AssetImage('assets/example_face/lego-${user.id}.jpeg')),
      title: Text(user.name),
      subtitle: Text(user.email),
      onTap: () => Get.to(const DetailPage(), arguments: [user.id]), // タップで詳細ページに遷移する
    );
  }
}

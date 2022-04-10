import 'package:get/get.dart';
import 'package:getx_example/presentation/detail_controller.dart';
import 'package:getx_example/presentation/list_controller.dart';

class ListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ListController>(ListController());
    Get.lazyPut<DetailController>(() => DetailController(), fenix: true);
  }
}
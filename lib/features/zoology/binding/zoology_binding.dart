import 'package:get/get.dart';
import 'package:purchase_inventory/features/zoology/controller/zoology_controller.dart';

class ZoologyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ZoologyController());
  }
}

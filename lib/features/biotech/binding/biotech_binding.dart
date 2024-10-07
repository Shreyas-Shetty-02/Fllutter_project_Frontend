import 'package:get/get.dart';
import 'package:purchase_inventory/features/biotech/controller/biotech_controller.dart';

class BiotechBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BiotechController());
  }
}

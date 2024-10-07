import 'package:get/get.dart';
import 'package:purchase_inventory/features/computer%20science/controller/computer_science_controller.dart';

class CSBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CSController());
  }
}

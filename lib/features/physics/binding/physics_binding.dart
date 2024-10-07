import 'package:get/get.dart';
import 'package:purchase_inventory/features/physics/controller/physics_controller.dart';

class PhysicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhysicsController());
  }
}

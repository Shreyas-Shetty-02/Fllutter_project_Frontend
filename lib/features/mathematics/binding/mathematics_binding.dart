import 'package:get/get.dart';
import 'package:purchase_inventory/features/mathematics/controller/mathematics_controller.dart';

class MathematicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MathematicsController());
  }
}

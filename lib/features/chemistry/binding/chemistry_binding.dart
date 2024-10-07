import 'package:get/get.dart';
import 'package:purchase_inventory/features/chemistry/controller/chemistry_controller.dart';

class ChemistryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChemistryController());
  }
}

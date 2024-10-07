import 'package:get/get.dart';
import 'package:purchase_inventory/features/botany/controller/botany_controller.dart';

class BotanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BotanyController());
  }
}

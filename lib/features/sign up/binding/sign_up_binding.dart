import 'package:get/get.dart';
import 'package:purchase_inventory/features/sign up/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}

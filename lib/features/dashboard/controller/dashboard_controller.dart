// ignore_for_file: unnecessary_overrides
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:purchase_inventory/features/dashboard/dashboard.dart';

class DashboardController extends GetxController {
  Rx<Dashboard> biotechModelObj = const Dashboard().obs;
  RxBool canPop = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void close() {
  //   Get.();
  // }
}

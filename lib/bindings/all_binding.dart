import 'package:get/get.dart';
import 'package:vault/controllers/calculator_controller.dart';
import 'package:vault/controllers/theme_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculatorController());
    Get.lazyPut(() => ThemeController());
  }
}

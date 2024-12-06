import 'package:get/get.dart';
import 'package:vault/core/services/shared_services.dart';
import 'package:vault/utils/keys.dart';
import 'package:vault/views/CalculatorScreen/calculator_screen.dart';
import 'package:vault/views/GetStarted/get_started_screen.dart';

class AppController extends GetxController {
  final sharedServices = SharedService();

  Future<bool> checkAppFirstTime() async {
    return await sharedServices.getData(
          SetType.bool,
          SharedKeys.alreadyOpened,
        ) ??
        false;
  }

  checkAppState() async {
    final already_opened = await checkAppFirstTime();

    if (already_opened) {
      Get.offAll(() => const CalculatorScreen());
    } else {
      Get.offAll(() => const GetStartedScreen());
    }
  }
}

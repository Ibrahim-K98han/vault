import 'package:get/get.dart';
import 'package:vault/controllers/theme_controller.dart';
import 'package:vault/core/services/shared_services.dart';
import 'package:vault/utils/keys.dart';
import 'package:vault/views/CalculatorScreen/calculator_screen.dart';
import 'package:vault/views/GetStarted/get_started_screen.dart';
import 'package:vault/views/HomeScreen/home_screen.dart';

class AppController extends GetxController {
  final sharedServices = SharedService();
  final themeController = Get.put(ThemeController());

  RxString lockerPin = RxString('');
  RxString tempPin = RxString('');

  @override
  onInit() async {
    super.onInit();
    lockerPin.value = await checkLockerPin();
    update();
    print('Locker Pin : ${lockerPin}');
  }

  Future<String> checkLockerPin() async {
    return await sharedServices.getData(SetType.string, SharedKeys.lockerPin) ??
        '';
  }

  Future<bool> checkAppFirstTime() async {
    return await sharedServices.getData(
            SetType.bool, SharedKeys.alreadyOpened) ??
        false;
  }

  checkSelectedTheme() async {
    SharedService()
        .getData(SetType.int, SharedKeys.selectedTheme)
        .then((value) {
      themeController.selectedTheme.value = value;
    });
  }

  checkAppState() async {
    final already_opened = await checkAppFirstTime();

    if (already_opened) {
      Get.offAll(() => const CalculatorScreen());
    } else {
      Get.offAll(() => const GetStartedScreen());
    }
  }

  setLockerPin() {
    sharedServices
        .setData(SetType.string, SharedKeys.lockerPin, tempPin.value)
        .then(
          (value) => Get.to(
            const HomeScreen(),
          ),
        );
  }
}

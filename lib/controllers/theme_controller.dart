import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxInt selectedTheme = RxInt(0);
  List<String> themes = [
    'assets/images/calculator_normal.png',
    'assets/images/calculator_circle.png'
  ];

  changeTheme(int index) {
    selectedTheme.value = index;
    update();
  }
}

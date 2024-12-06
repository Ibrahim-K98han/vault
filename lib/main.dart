import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/bindings/all_binding.dart';
import 'package:vault/controllers/theme_controller.dart';
import 'package:vault/core/services/shared_services.dart';
import 'package:vault/utils/colors.dart';
import 'package:vault/utils/keys.dart';
import 'package:vault/views/SplashScreen/splash_screen.dart';

void main() {
  AllBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeController = Get.put(ThemeController());

  checkSelectedTheme() async {
    SharedService()
        .getData(SetType.int, SharedKeys.selectedTheme)
        .then((value) {
      themeController.selectedTheme.value = value;
    });
  }

  @override
  void initState() {
   checkSelectedTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.background),
      home: SplashScreen(),
    );
  }
}

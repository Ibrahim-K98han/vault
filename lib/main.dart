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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.background),
      home: const SplashScreen(),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/controllers/app_controller.dart';
import 'package:vault/utils/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final appController = Get.put(AppController());
  @override
  void initState() {
    appController.checkSelectedTheme();
    Timer(const Duration(seconds: 3), () {
      appController.checkAppState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Image.asset('assets/images/vault.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              AppConfig.appName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

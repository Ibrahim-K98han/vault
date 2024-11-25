import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/utils/config.dart';
import 'package:vault/views/GetStarted/get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.to(() => const GetStartedScreen(),);
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

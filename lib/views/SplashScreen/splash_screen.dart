import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vault/controllers/ads_controller.dart';
import 'package:vault/controllers/app_controller.dart';
import 'package:vault/utils/config.dart';
import 'package:vault/views/HomeScreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  final bool? isLoading;
  const SplashScreen({
    super.key,
    this.isLoading,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final appController = Get.put(AppController());
  final adsController = Get.put(AdsController());
  @override
  void initState() {
    if (widget.isLoading == true) {
      adsController.interstitialAd!.fullScreenContentCallback =
          FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          Get.offAll(
            () => const HomeScreen(),
          );
        },
      );
      adsController.interstitialAd!.show();
    } else {
      appController.checkSelectedTheme();
      Timer(const Duration(seconds: 3), () {
        appController.checkAppState();
      });
    }
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

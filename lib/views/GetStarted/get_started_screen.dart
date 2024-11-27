import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vault/utils/colors.dart';
import 'package:vault/utils/config.dart';
import 'package:vault/views/CalculatorScreen/calculator_screen.dart';
import 'package:vault/widgets/custom_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/vault.png'),
              ),
              const Text(
                'Welcome to ${AppConfig.appName}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                AppConfig.hidePrivacy,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: size.height * .3,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        AppConfig.privacyNotice,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: 'Continue',
                onTap: () => Get.offAll(
                  () => const CalculatorScreen(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                backgroundColor: Colors.transparent,
                title: 'Disagree',
                onTap: () {
                  Get.defaultDialog(
                      backgroundColor: AppColors.secondary,
                      title:
                          'If disagree, you will not able to use ${AppConfig.appName}',
                      titleStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      content: const Text(
                        'Privacy and policy',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          child: Text(
                            'Quit',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.offAll(
                            () => const CalculatorScreen(),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

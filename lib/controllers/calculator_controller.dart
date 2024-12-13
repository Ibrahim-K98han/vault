import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:vault/controllers/app_controller.dart';
import 'package:vault/utils/colors.dart';
import 'package:vault/views/SplashScreen/splash_screen.dart';

class CalculatorController extends GetxController {
  final appController = Get.put(AppController());
  RxString userInput = RxString('');
  RxString result = RxString('0');
  List<String> button = [
    '',
    '',
    'AC',
    'C',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  Color getButtonTextColor(String text) {
    if (text == 'AC' ||
        text == 'C' ||
        text == '/' ||
        text == '*' ||
        text == '-' ||
        text == '+') {
      return AppColors.primary;
    } else {
      return Colors.white;
    }
  }

  Color getButtonBgColor(String text) {
    if (text == '=') {
      return AppColors.primary;
    } else {
      return AppColors.secondary;
    }
  }

  handleButton(String text) {
    if (text == 'AC') {
      userInput.value = '';
      result.value = '0';
      update();
      return;
    }
    if (text == 'C') {
      if (userInput.isNotEmpty) {
        userInput.value =
            userInput.value.substring(0, userInput.value.length - 1);
        update();
        return;
      } else {
        return null;
      }
    }

    if (text == '=') {
      if (appController.lockerPin.value.isEmpty) {
        if (appController.tempPin.value.isEmpty) {
          appController.tempPin.value = userInput.value;
          userInput.value = '';
          update();
          print('temp pine is ${appController.tempPin.value}');
          return;
        } else {
          if (appController.tempPin.value != userInput.value) {
            Get.snackbar(
              'Incorrect',
              'PIN Number should be match with previous one',
              colorText: Colors.white,
            );
            return;
          } else {
            appController.setLockerPin();
            update();
            return;
          }
        }
      } else {
        if (appController.lockerPin.value == userInput.value) {
          Get.to(
            () => const SplashScreen(
              isLoading: true,
            ),
          );
          return;
        } else {
          var calculated = calculate();
          if (calculated.endsWith('.0')) {
            result.value = calculated.replaceAll('.0', '');
            update();
            return;
          }
        }
      }
    }

    userInput.value = userInput.value + text;
    update();
    return;
  }

  String calculate() {
    try {
      var parsed = Parser().parse(userInput.value);
      var result = parsed.evaluate(EvaluationType.REAL, ContextModel());
      return result.toString();
    } catch (e) {
      return 'Syntax Error';
    }
  }
}

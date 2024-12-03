import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:vault/utils/colors.dart';

class CalculatorController extends GetxController {
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

  RxString userInput = RxString('');
  RxString result = RxString('0');

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
      var calculated = calculate();
      if (calculated.endsWith('.0')) {
        result.value = calculated.replaceAll('.0', '');
        update();
        return;
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

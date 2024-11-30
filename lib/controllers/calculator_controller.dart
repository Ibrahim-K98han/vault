import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
}

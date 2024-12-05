import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/calculator_controller.dart';

Widget calculatorButton(String button) {
  final controller = Get.put(CalculatorController());
  return GestureDetector(
    onTap: () {
      controller.handleButton(button);
    },
    child: Container(
      decoration: BoxDecoration(
        color: controller.getButtonBgColor(button),
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          top: BorderSide(color: Colors.white, width: 1.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: .5,
          )
        ],
      ),
      child: Center(
        child: Text(
          button,
          style: TextStyle(
            color: controller.getButtonTextColor(button),
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
    ),
  );
}

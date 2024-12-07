import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/controllers/app_controller.dart';
import 'package:vault/controllers/calculator_controller.dart';
import 'package:vault/views/CalculatorScreen/widgets/calculator_button.dart';
import 'package:vault/widgets/custom_app_bar.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: GetBuilder<CalculatorController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appController.lockerPin.value.isEmpty
                      ? Text(
                          'Please ${appController.tempPin.value.isEmpty ? 'enter' : 'confirm'} your passcode',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.5),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            controller.userInput.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            controller.result.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.button.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      final button = controller.button[index];
                      return button.isEmpty
                          ? const SizedBox()
                          : calculatorButton(button);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

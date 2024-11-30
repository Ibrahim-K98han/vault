import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/controllers/calculator_controller.dart';
import 'package:vault/widgets/custom_app_bar.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
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
                  Text(
                    'Please enter your passcode',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
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
                          : Container(
                              decoration: BoxDecoration(
                                color: controller.getButtonBgColor(button),
                                borderRadius: BorderRadius.circular(20),
                                border: const Border(
                                  top: BorderSide(
                                      color: Colors.white, width: 1.5),
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
                                    color:
                                        controller.getButtonTextColor(button),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            );
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

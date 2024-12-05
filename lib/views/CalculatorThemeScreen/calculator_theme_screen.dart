import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/controllers/theme_controller.dart';
import 'package:vault/widgets/custom_app_bar.dart';

class CalculatorThemeScreen extends StatelessWidget {
  const CalculatorThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          isLeading: true,
          title: 'Theme',
          action: [],
        ),
        body: GetBuilder<ThemeController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: controller.themes.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}

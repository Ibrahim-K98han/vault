import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/controllers/theme_controller.dart';
import 'package:vault/core/services/shared_services.dart';
import 'package:vault/utils/colors.dart';
import 'package:vault/utils/keys.dart';
import 'package:vault/widgets/custom_app_bar.dart';
import 'package:vault/widgets/custom_button.dart';

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
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: controller.themes.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.changeTheme(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            border: Border.all(
                                color: controller.selectedTheme.value == index
                                    ? AppColors.primary
                                    : Colors.white.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            image: DecorationImage(
                              image: AssetImage(controller.themes[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: controller.selectedTheme.value == index
                              ? const Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: AppColors.primary,
                                    )
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    title: 'Confirm',
                    onTap: () {
                      SharedService().setData(
                        SetType.int,
                        SharedKeys.selectedTheme,
                        controller.selectedTheme.value,
                      );
                      Get.back();
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}

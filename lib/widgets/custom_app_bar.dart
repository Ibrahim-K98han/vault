import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/views/CalculatorThemeScreen/calculator_theme_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.title,
    this.isLeading,
    this.action,
  });

  final String? title;
  final bool? isLeading;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: title == null
          ? null
          : Text(
              title!,
              style: const TextStyle(color: Colors.white),
            ),
      leading: isLeading == true
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )
          : null,
      actions: action ??
          [
            IconButton(
              onPressed: () => Get.to(
                () => const CalculatorThemeScreen(),
              ),
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

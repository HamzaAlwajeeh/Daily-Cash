import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButtomn extends StatelessWidget {
  const CustomFloatingActionButtomn({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      onPressed: () {},
      child: const Icon(Icons.add, color: AppColors.textFeilColor),
    );
  }
}

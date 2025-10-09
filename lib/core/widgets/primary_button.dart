import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        minimumSize: const Size(double.infinity, 56),
      ),
      child: Text(
        text,
        style: TextStyles.bold18.copyWith(color: AppColors.textPrimaryColor),
      ),
    );
  }
}

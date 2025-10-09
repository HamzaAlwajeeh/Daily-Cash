import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: 43,
      decoration: BoxDecoration(
        color: const Color(0xFFD0BEDF).withOpacity(0.11),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          'تخط',
          style: TextStyles.bold16.copyWith(
            color: AppColors.textSecondaryColor,
          ),
        ),
      ),
    );
  }
}

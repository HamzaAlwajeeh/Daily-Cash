import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class OnBoardingTextTitle extends StatelessWidget {
  const OnBoardingTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'مرحبا بك في ',
          style: TextStyles.bold18.copyWith(
            color: AppColors.textSecondaryColor,
          ),
        ),
        Text(
          'CASH ',
          style: TextStyles.bold18.copyWith(color: Color(0xffF39D9E)),
        ),
        Text(
          'DAILY',
          style: TextStyles.bold18.copyWith(color: Color(0xffD0BEDF)),
        ),
      ],
    );
  }
}

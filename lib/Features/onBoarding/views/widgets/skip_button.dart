import 'package:daily_cash/Features/auth/views/login_view.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Prefs.setBool('seenOnBoarding', true);
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      },
      child: Container(
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
      ),
    );
  }
}

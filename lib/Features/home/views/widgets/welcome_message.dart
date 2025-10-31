import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class WelcomMessage extends StatelessWidget {
  const WelcomMessage({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.textFeilSecondaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.textFeilSecondaryColor,
            blurRadius: 30,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.textSecondaryColor,
              child: CircleAvatar(
                radius: 38,
                backgroundColor: AppColors.primaryColor,
                child: Image.asset(Assets.imagesProfile, fit: BoxFit.fill),
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('مرحبا , ', style: TextStyles.bold16),
                    Text(
                      name,
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('كيف حالك اليوم؟', style: TextStyles.semiBold12),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

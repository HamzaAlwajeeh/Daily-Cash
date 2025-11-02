import 'package:daily_cash/Features/profile/views/profile_view.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class WelcomeMessageAndProfileInfo extends StatelessWidget {
  const WelcomeMessageAndProfileInfo({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, ProfileView.routeName);
      },
      child: Container(
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
                        title,
                        style: TextStyles.bold16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(subTitle, style: TextStyles.semiBold12),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

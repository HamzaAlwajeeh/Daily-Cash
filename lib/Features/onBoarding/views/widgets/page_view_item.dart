import 'package:daily_cash/Features/onBoarding/views/widgets/on_boeardin_text_title.dart';
import 'package:daily_cash/Features/onBoarding/views/widgets/skip_button.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SizedBox(
        height: 565,
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [SkipButton()],
            ),
            Image.asset(Assets.imagesOnBoardingLogo, width: 287),
            const SizedBox(height: 20),
            OnBoardingTextTitle(),
            const SizedBox(height: 4),
            Text(
              textAlign: TextAlign.center,
              'حيث السهوله والأمان',
              maxLines: 2,
              style: TextStyles.bold16.copyWith(
                color: AppColors.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

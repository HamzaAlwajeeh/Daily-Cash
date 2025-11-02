import 'package:daily_cash/Features/home/views/widgets/welcome_message_and_profile_info.dart';
import 'package:daily_cash/Features/profile/views/widgets/general_section.dart';
import 'package:daily_cash/Features/profile/views/widgets/general_summary.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('الحساب الشخصي', style: TextStyles.bold18),
          WelcomeMessageAndProfileInfo(
            title: 'حمزة الوجيه',
            subTitle: 'ha20mza60@gmail.com',
          ),
          GeneralSection(),
          Divider(color: AppColors.textSecondaryColor),
          GeneralSummary(),
          Divider(color: AppColors.textSecondaryColor),
          Spacer(),
          PrimaryButton(
            text: 'تسجيل الخروج',
            onPressed: () {},
            color: AppColors.customRed.withOpacity(0.7),
            textColor: AppColors.textSecondaryColor,
          ),
        ],
      ),
    );
  }
}

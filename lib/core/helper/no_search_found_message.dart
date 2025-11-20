import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotSearchFoundMessage extends StatelessWidget {
  const NotSearchFoundMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.imagesSearch),
        const SizedBox(height: 10),
        Text(
          'البحث',
          style: TextStyles.bold24.copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(height: 3),
        Text(message, style: TextStyles.bold20),
      ],
    );
  }
}

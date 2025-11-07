import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
    required this.subText,
    required this.primaryText,
    this.onTap,
  });
  final String subText;
  final String primaryText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$subText ', style: TextStyles.bold16),
        GestureDetector(
          onTap: onTap,
          child: Text(
            primaryText,
            style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}

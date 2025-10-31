import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class NoRecentOperatiosWidget extends StatelessWidget {
  const NoRecentOperatiosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 5,
        children: [
          Image.asset(Assets.imagesNotFountYet, width: 150, height: 150),
          Text('لا توجد عمليات بعد', style: TextStyles.bold16),
        ],
      ),
    );
  }
}

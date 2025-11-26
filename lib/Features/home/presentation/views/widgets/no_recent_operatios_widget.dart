import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class NoRecentOperatiosWidget extends StatelessWidget {
  const NoRecentOperatiosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: 5,
        children: [
          Image.asset(Assets.imagesNotFountYet, width: 250, height: 200),
          Text('لا توجد عمليات بعد', style: TextStyles.bold18),
        ],
      ),
    );
  }
}

import 'package:daily_cash/Features/home/views/widgets/recent_operations.dart';
import 'package:daily_cash/Features/home/views/widgets/today_summary.dart';
import 'package:daily_cash/Features/home/views/widgets/total_amoungt.dart';
import 'package:daily_cash/Features/home/views/widgets/welcome_message_and_profile_info.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 16, top: 70),
      child: Column(
        spacing: 16,
        children: [
          WelcomeMessageAndProfileInfo(
            title: 'حمزة الوجيه',
            subTitle: 'كيف حالك اليوم؟',
          ),
          TotalAmount(totalAmount: '1,750,000'),
          TodaySummary(),
          RecentOperations(),
        ],
      ),
    );
  }
}

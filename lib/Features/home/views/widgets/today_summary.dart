import 'package:daily_cash/Features/home/views/widgets/summary_item.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TodaySummary extends StatelessWidget {
  const TodaySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'ملخص اليوم',
              style: TextStyles.bold16,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SummaryItem(amount: '1,500,000', type: 'income'),
              const SizedBox(width: 10),
              SummaryItem(amount: '1,500,000', type: 'outcome'),
            ],
          ),
        ],
      ),
    );
  }
}

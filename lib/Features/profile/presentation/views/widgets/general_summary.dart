import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/general_summary_item.dart';
import 'package:flutter/material.dart';

class GeneralSummary extends StatelessWidget {
  const GeneralSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('إحصائيات', style: TextStyles.bold16),
        ),
        Row(
          children: [
            GeneralSummaryItem(title: 'عدد العمال', count: 300, type: 'green'),
            const SizedBox(width: 10),
            GeneralSummaryItem(title: 'عدد المشاريع', count: 5, type: 'red'),
          ],
        ),
      ],
    );
  }
}

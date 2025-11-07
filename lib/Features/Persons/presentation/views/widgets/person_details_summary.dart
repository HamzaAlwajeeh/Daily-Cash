import 'package:daily_cash/core/widgets/general_summary_item.dart';
import 'package:flutter/material.dart';

class PersonDetailsSummary extends StatelessWidget {
  const PersonDetailsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Row(
          children: [
            GeneralSummaryItem(
              title: 'الإجمالي له',
              count: 500000,
              type: 'green',
            ),
            const SizedBox(width: 10),
            GeneralSummaryItem(
              title: 'الإجمالي عليه',
              count: 500000,
              type: 'red',
            ),
          ],
        ),
      ],
    );
  }
}

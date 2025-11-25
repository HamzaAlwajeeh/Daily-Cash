import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/no_recent_operatios_widget.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/recent_operations_list_view.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class RecentOperations extends StatelessWidget {
  const RecentOperations({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Operation> operations = [];
    final topTen =
        operations.length > 10
            ? operations.sublist(operations.length - 10)
            : operations;

    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'اخر العمليات',
                style: TextStyles.bold16,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 12),
            operations.isEmpty
                ? NoRecentOperatiosWidget()
                : RecentOperationsListView(operations: topTen),
          ],
        ),
      ),
    );
  }
}

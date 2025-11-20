import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/operation_item.dart';
import 'package:flutter/material.dart';

class RecentOperationsListView extends StatelessWidget {
  const RecentOperationsListView({super.key, required this.operations});
  final List<OperationModel> operations;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: operations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: OperationItem(operation: operations[index]),
        );
      },
    );
  }
}

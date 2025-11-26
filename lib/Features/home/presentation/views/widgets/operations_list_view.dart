import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/operation_item.dart';
import 'package:flutter/material.dart';

class OperationsListView extends StatelessWidget {
  const OperationsListView({super.key, required this.operations});
  final List<Operation> operations;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        itemCount: operations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: OperationItem(operation: operations[index]),
          );
        },
      ),
    );
  }
}

import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/views/widgets/operation_item.dart';
import 'package:flutter/material.dart';

class OperationsListView extends StatelessWidget {
  const OperationsListView({super.key, required this.operations});
  final List<OperationModel> operations;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
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

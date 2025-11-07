import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/views/widgets/operation_item.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PersonDetailsListView extends StatelessWidget {
  const PersonDetailsListView({super.key, required this.operations});
  final List<OperationModel> operations;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: operations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: OperationItem(
            operation: operations[index],
            backgroundColor: AppColors.textFeilColor,
          ),
        );
      },
    );
  }
}

import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/no_recent_operatios_widget.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/operations_list_view.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class OutcomeOperationsViewBody extends StatelessWidget {
  const OutcomeOperationsViewBody({super.key, required this.outcomeOperations});
  final List<OperationModel> outcomeOperations;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 40),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'المنصرف'),
          CustomTextFeild(
            hintText: 'البحث عن ...',
            suffixIcon: Assets.imagesFilter,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('كل المنصرف', style: TextStyles.bold16),
          ),
          outcomeOperations.isEmpty
              ? NoRecentOperatiosWidget()
              : OperationsListView(operations: outcomeOperations),
        ],
      ),
    );
  }
}

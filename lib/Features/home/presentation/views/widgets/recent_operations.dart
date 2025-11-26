import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_state.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/no_recent_operatios_widget.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/recent_operations_list_view.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentOperations extends StatelessWidget {
  const RecentOperations({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllOperationsCubit, GetAllOperationsState>(
      builder: (context, state) {
        List<Operation> operations =
            BlocProvider.of<GetAllOperationsCubit>(context).operations;
        // ناخذ اخر عشر عمليات ونقلبها
        List<Operation> topTen = operations.reversed.take(10).toList();
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
                if (state is GetAllOperationsFailure)
                  Center(child: Text(state.errorMessage))
                else if (state is GetAllOperationsLoading)
                  CustomLoadingIndicator()
                else if (operations.isEmpty)
                  NoRecentOperatiosWidget()
                else
                  RecentOperationsListView(operations: topTen),
              ],
            ),
          ),
        );
      },
    );
  }
}

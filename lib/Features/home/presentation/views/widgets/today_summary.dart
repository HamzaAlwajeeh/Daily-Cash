import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_state.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_cash_box_cubit/get_cash_box_cubit.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/summary_item.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TodaySummary extends StatelessWidget {
  const TodaySummary({super.key, required this.type, required this.title});
  final String type;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllOperationsCubit, GetAllOperationsState>(
      builder: (context, state) {
        double income =
            type == 'today'
                ? BlocProvider.of<GetAllOperationsCubit>(context).totalIncome
                : double.parse(
                  BlocProvider.of<GetCashBoxCubit>(
                    context,
                  ).cashBox!.totalIncome,
                );
        double outcome =
            type == 'today'
                ? BlocProvider.of<GetAllOperationsCubit>(context).totalExpense
                : double.parse(
                  BlocProvider.of<GetCashBoxCubit>(
                    context,
                  ).cashBox!.totalExpense,
                );
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title,
                  style: TextStyles.bold16,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  SummaryItem(
                    type: 'income',
                    amount: NumberFormat('#,###').format(income.round()),
                  ),
                  const SizedBox(width: 10),
                  SummaryItem(
                    type: 'expense',
                    amount: NumberFormat('#,###').format(outcome.round()),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

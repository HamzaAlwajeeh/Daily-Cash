import 'package:daily_cash/Features/home/presentation/controller/get_incom_operations_cubit/get_incom_operations_cubit.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/todat_income_operations_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodayIncomeOperationsView extends StatefulWidget {
  const TodayIncomeOperationsView({super.key});
  static const String routeName = '/today-income-operations';

  @override
  State<TodayIncomeOperationsView> createState() =>
      _TodayIncomeOperationsViewState();
}

class _TodayIncomeOperationsViewState extends State<TodayIncomeOperationsView> {
  @override
  void initState() {
    BlocProvider.of<GetIncomOperationsCubit>(context).getIncomOperationss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TodayIncomeOperationsViewBody());
  }
}

import 'package:daily_cash/Features/home/presentation/controller/get_incom_operations_cubit/get_incom_operations_cubit.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/income_operations_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeOperationsView extends StatefulWidget {
  const IncomeOperationsView({super.key});
  static const String routeName = '/income-operations';

  @override
  State<IncomeOperationsView> createState() => _IncomeOperationsViewState();
}

class _IncomeOperationsViewState extends State<IncomeOperationsView> {
  @override
  void initState() {
    BlocProvider.of<GetIncomOperationsCubit>(context).getIncomOperationss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: IncomeOperationsViewBody());
  }
}

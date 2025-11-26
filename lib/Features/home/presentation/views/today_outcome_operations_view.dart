import 'package:daily_cash/Features/home/presentation/controller/get_incom_operations_cubit/get_incom_operations_cubit.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/todat_outcome_operation_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodayOutcomeOperationsView extends StatefulWidget {
  const TodayOutcomeOperationsView({super.key});
  static const String routeName = '/today-outcome-operations';

  @override
  State<TodayOutcomeOperationsView> createState() =>
      _TodayOutcomeOperationsViewState();
}

class _TodayOutcomeOperationsViewState
    extends State<TodayOutcomeOperationsView> {
  @override
  void initState() {
    BlocProvider.of<GetIncomOperationsCubit>(context).getIncomOperationss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TodatOutcomeOperationViewBody());
  }
}

import 'package:daily_cash/Features/home/presentation/controller/get_outcom_operations_cubit/get_outcom_operations_cubit.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/outcome_operations_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutcomeOperationsView extends StatefulWidget {
  const OutcomeOperationsView({super.key});
  static const String routeName = '/outcome-operations';

  @override
  State<OutcomeOperationsView> createState() => _OutcomeOperationsViewState();
}

class _OutcomeOperationsViewState extends State<OutcomeOperationsView> {
  @override
  void initState() {
    BlocProvider.of<GetOutcomOperationsCubit>(context).getOutcomOperationss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OutcomeOperationsViewBody());
  }
}

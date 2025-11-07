import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/data/test_data.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/income_operations_view_body.dart';
import 'package:flutter/material.dart';

class IncomeOperationsView extends StatefulWidget {
  const IncomeOperationsView({super.key});
  static const String routeName = '/income-operations';

  @override
  State<IncomeOperationsView> createState() => _IncomeOperationsViewState();
}

class _IncomeOperationsViewState extends State<IncomeOperationsView> {
  List<OperationModel> incomeOperations = [];
  List<OperationModel> allOperations = [];

  @override
  void initState() {
    allOperations = operationsData();
    for (var operation in allOperations) {
      if (operation.type == 'income') {
        incomeOperations.add(operation);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IncomeOperationsViewBody(incomeOperations: incomeOperations),
    );
  }
}

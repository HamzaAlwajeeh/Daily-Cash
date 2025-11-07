import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/data/test_data.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/outcome_operations_view_body.dart';
import 'package:flutter/material.dart';

class OutcomeOperationsView extends StatefulWidget {
  const OutcomeOperationsView({super.key});
  static const String routeName = '/outcome-operations';

  @override
  State<OutcomeOperationsView> createState() => _OutcomeOperationsViewState();
}

class _OutcomeOperationsViewState extends State<OutcomeOperationsView> {
  List<OperationModel> outcomeOperations = [];
  List<OperationModel> allOperations = [];

  @override
  void initState() {
    allOperations = operationsData();
    for (var operation in allOperations) {
      if (operation.type == 'outcome') {
        outcomeOperations.add(operation);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OutcomeOperationsViewBody(outcomeOperations: outcomeOperations),
    );
  }
}

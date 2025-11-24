import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/data/test_data.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/all_operations_view_body.dart';
import 'package:daily_cash/core/widgets/custom_floating_action_buttomn.dart';
import 'package:flutter/material.dart';

class AllOperationsView extends StatelessWidget {
  const AllOperationsView({super.key});
  static const String routeName = '/all-operations';
  @override
  Widget build(BuildContext context) {
    List<OperationModel> operations = operationsData();
    return Scaffold(
      body: AllOperationsViewBody(operations: operations),
      floatingActionButton: CustomFloatingActionButtomn(onPressed: () {}),
    );
  }
}

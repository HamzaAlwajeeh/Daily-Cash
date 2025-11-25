import 'package:daily_cash/Features/home/presentation/views/add_operation_view.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/all_operations_view_body.dart';
import 'package:daily_cash/core/widgets/custom_floating_action_buttomn.dart';
import 'package:flutter/material.dart';

class AllOperationsView extends StatelessWidget {
  const AllOperationsView({super.key});
  static const String routeName = '/all-operations';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllOperationsViewBody(),
      floatingActionButton: CustomFloatingActionButtomn(
        onPressed: () async {
          Navigator.pushNamed(context, AddOperationView.routeName);
        },
      ),
    );
  }
}

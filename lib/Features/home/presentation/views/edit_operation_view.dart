import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/edit_operation_view_body.dart';
import 'package:flutter/material.dart';

class EditOperationView extends StatelessWidget {
  const EditOperationView({super.key, required this.operation});
  static const String routeName = '/edit_operation';
  final OperationModel operation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditOperationViewBody(operation: operation));
  }
}

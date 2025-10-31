import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:flutter/material.dart';

class OperationDetailsView extends StatelessWidget {
  const OperationDetailsView({super.key, required this.operation});
  static const String routeName = '/operation-details';
  final OperationModel operation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Operation Details View')));
  }
}

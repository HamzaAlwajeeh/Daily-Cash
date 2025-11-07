import 'package:daily_cash/Features/home/presentation/views/widgets/add_operation_view_body.dart';
import 'package:flutter/material.dart';

class AddOperationView extends StatelessWidget {
  const AddOperationView({super.key});
  static const String routeName = '/add_operation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AddOperationViewBody());
  }
}

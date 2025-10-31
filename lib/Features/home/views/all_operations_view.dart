import 'package:daily_cash/Features/home/views/widgets/all_operations_view_body.dart';
import 'package:flutter/material.dart';

class AllOperationsView extends StatelessWidget {
  const AllOperationsView({super.key});
  static const String routeName = '/all-operations';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AllOperationsViewBody());
  }
}

import 'package:daily_cash/Features/home/presentation/views/add_operation_view.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:daily_cash/core/widgets/custom_floating_action_buttomn.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      floatingActionButton: CustomFloatingActionButtomn(
        onPressed: () {
          Navigator.pushNamed(context, AddOperationView.routeName);
        },
      ),
    );
  }
}

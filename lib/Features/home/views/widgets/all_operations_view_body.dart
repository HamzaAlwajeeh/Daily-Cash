import 'package:daily_cash/Features/home/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AllOperationsViewBody extends StatelessWidget {
  const AllOperationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 70),
      child: Column(children: [CustomAppBar()]),
    );
  }
}

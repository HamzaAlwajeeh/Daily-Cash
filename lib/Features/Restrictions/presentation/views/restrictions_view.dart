import 'package:daily_cash/Features/Restrictions/presentation/views/add_restriction_view.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/restrictions_view_body.dart';
import 'package:daily_cash/core/widgets/custom_floating_action_buttomn.dart';
import 'package:flutter/material.dart';

class RestrictionsView extends StatelessWidget {
  const RestrictionsView({super.key});
  static const String routeName = '/restrictionsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RestrictionsViewBody(),
      floatingActionButton: CustomFloatingActionButtomn(
        onPressed: () {
          Navigator.pushNamed(context, AddRestrictionView.routeName);
        },
      ),
    );
  }
}

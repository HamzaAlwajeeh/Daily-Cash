import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/add_restriction_view_body.dart';
import 'package:flutter/material.dart';

class AddRestrictionView extends StatelessWidget {
  const AddRestrictionView({super.key});
  static const String routeName = '/addRestrictionView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AddRestrictionViewBody(),
    );
  }
}

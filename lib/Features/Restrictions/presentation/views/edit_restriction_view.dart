import 'package:daily_cash/Features/Restrictions/data/models/restrictions_model.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/edit_restriction_view_body.dart';
import 'package:flutter/material.dart';

class EditRestrictionView extends StatelessWidget {
  const EditRestrictionView({super.key, required this.restriction});
  static const String routeName = '/editRestrictionView';
  final RestrictionsModel restriction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditRestrictionViewBody());
  }
}

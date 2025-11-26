import 'package:daily_cash/Features/Restrictions/data/models/restriction/restriction.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/edit_restriction_form.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class EditRestrictionViewBody extends StatelessWidget {
  const EditRestrictionViewBody({super.key, required this.restriction});
  final Restriction restriction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'تعديل قيد'),
            EditRestrictionForm(restriction: restriction),
          ],
        ),
      ),
    );
  }
}

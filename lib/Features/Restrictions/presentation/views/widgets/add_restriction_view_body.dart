import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/add_restriction_form.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddRestrictionViewBody extends StatelessWidget {
  const AddRestrictionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [CustomAppBar(title: 'إنشاء قيد'), AddRestrictionForm()],
        ),
      ),
    );
  }
}

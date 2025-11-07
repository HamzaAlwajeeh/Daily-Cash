import 'package:daily_cash/Features/Persons/presentation/views/widgets/person_type.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class AddPersonBottomSheet extends StatefulWidget {
  const AddPersonBottomSheet({super.key});

  @override
  State<AddPersonBottomSheet> createState() => _AddPersonBottomSheetState();
}

class _AddPersonBottomSheetState extends State<AddPersonBottomSheet> {
  String personName = '';
  String personType = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: 16.0,
          left: 16.0,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('جديد', style: TextStyles.bold18),
            const SizedBox(height: 20),
            PersonType(title: 'عامل', type: 'employee'),
            const SizedBox(height: 10),
            PersonType(title: 'مشروع', type: 'project'),
            const SizedBox(height: 10),
            CustomTextFeild(
              fillColor: AppColors.textFeilColor,
              hintText: 'الإسم',
              onChanged: (vale) {
                personName = vale;
              },
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              text: 'إضافة',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

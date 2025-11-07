import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/general_section_item.dart';
import 'package:flutter/material.dart';

class AddOperationViewBody extends StatefulWidget {
  const AddOperationViewBody({super.key});

  @override
  State<AddOperationViewBody> createState() => _AddOperationViewBodyState();
}

class _AddOperationViewBodyState extends State<AddOperationViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String operationType = '';
  String date = '';
  String amount = '';
  String person = '';
  String details = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: Column(
        spacing: 20,
        children: [
          CustomAppBar(title: 'إنشاء عملية'),
          GeneralSectionItem(
            title: 'إيراد',
            icon: Assets.imagesIncome,
            hasSwitch: true,
            onChanged: (value) {
              setState(() {
                operationType = 'income';
              });
            },
          ),
          GeneralSectionItem(
            title: 'منصرف',
            icon: Assets.imagesOutcome,
            hasSwitch: true,
            onChanged: (value) {
              setState(() {
                operationType = 'outcome';
              });
            },
          ),
          Form(
            key: formKey,
            child: Column(
              spacing: 30,
              children: [
                CustomTextFormFeild(
                  hintText: 'نوع العملية',
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    operationType = value ?? '';
                  },
                ),
                CustomTextFormFeild(
                  hintText: 'التاريخ',
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    date = value ?? '';
                  },
                ),
                CustomTextFormFeild(
                  hintText: 'المبلغ',
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    date = value ?? '';
                  },
                ),
                CustomTextFormFeild(
                  hintText: 'اسم العامل/المشروع',
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    person = value ?? '';
                  },
                ),
                CustomTextFormFeild(
                  hintText: 'البيان',
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    details = value ?? '';
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

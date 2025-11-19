import 'dart:developer';

import 'package:daily_cash/Features/Restrictions/data/models/restrictions_model.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditRestrictionForm extends StatefulWidget {
  const EditRestrictionForm({super.key, required this.restriction});
  final RestrictionsModel restriction;
  @override
  State<EditRestrictionForm> createState() => _EditRestrictionFormState();
}

class _EditRestrictionFormState extends State<EditRestrictionForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String fromPerson = '';
  String toPerson = '';
  String amount = '';
  String date = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('من حساب', style: TextStyles.bold16),
          ),
          const SizedBox(height: 8),
          CustomTextFormFeild(
            initialValue: widget.restriction.fromPerson,
            hintText: 'اسم المشروع/العامل',
            keyboardType: TextInputType.text,
            readOnly: true,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('الى حساب', style: TextStyles.bold16),
          ),
          const SizedBox(height: 8),
          CustomTextFormFeild(
            initialValue: widget.restriction.toPerson,
            hintText: 'اسم المشروع/العامل',
            keyboardType: TextInputType.text,
            readOnly: true,
          ),
          const SizedBox(height: 38),
          Column(
            spacing: 38,
            children: [
              CustomTextFormFeild(
                initialValue: widget.restriction.date,
                hintText: 'التاريخ',
                keyboardType: TextInputType.text,
                suffixIcon: SvgPicture.asset(Assets.imagesCalendar),
                onChanged: (value) {
                  date = value;
                },
              ),
              CustomTextFormFeild(
                initialValue: widget.restriction.amount.toString(),
                hintText: 'المبلغ',
                keyboardType: TextInputType.number,
                suffixIcon: SvgPicture.asset(Assets.imagesDolarSign),
                onChanged: (value) {
                  amount = value.toString();
                },
              ),
              CustomTextFormFeild(
                initialValue: widget.restriction.description,
                hintText: 'البيان',
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            text: 'تعديل',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                autovalidateMode = AutovalidateMode.disabled;
                setState(() {});
                log('$fromPerson - $toPerson - $date - $amount - $description');
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}

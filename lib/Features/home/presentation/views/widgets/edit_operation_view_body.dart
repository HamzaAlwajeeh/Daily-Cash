import 'dart:developer';

import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/general_section_item.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditOperationViewBody extends StatefulWidget {
  const EditOperationViewBody({super.key, required this.operation});
  final OperationModel operation;
  @override
  State<EditOperationViewBody> createState() => _EditOperationViewBodyState();
}

class _EditOperationViewBodyState extends State<EditOperationViewBody> {
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
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            CustomAppBar(title: 'تعديل العملية'),
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
                    initialValue: widget.operation.type,
                    readOnly: true,
                    hintText: 'نوع العملية',
                    keyboardType: TextInputType.text,
                    onSaved: (value) {},
                  ),
                  CustomTextFormFeild(
                    initialValue: widget.operation.date,
                    readOnly: true,
                    suffixIcon: SvgPicture.asset(Assets.imagesCalendar),
                    hintText: 'التاريخ',
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      date = value ?? '';
                    },
                  ),
                  CustomTextFormFeild(
                    initialValue: widget.operation.amount.toString(),
                    suffixIcon: SvgPicture.asset(Assets.imagesDolarSign),
                    hintText: 'المبلغ',
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      date = value ?? '';
                    },
                  ),
                  CustomTextFormFeild(
                    initialValue: widget.operation.title,
                    hintText: 'اسم العامل/المشروع',
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      person = value ?? '';
                    },
                  ),
                  CustomTextFormFeild(
                    initialValue: widget.operation.details,
                    hintText: 'البيان',
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      details = value ?? '';
                    },
                  ),
                  PrimaryButton(
                    text: 'تعديل',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        autovalidateMode = AutovalidateMode.disabled;
                        setState(() {});
                        log(
                          '$operationType - $date - $amount - $person - $details',
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

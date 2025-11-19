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
  TextEditingController dateController = TextEditingController();
  TextEditingController fromPersonController = TextEditingController();
  TextEditingController toPersonController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    dateController.text = widget.restriction.date;
    fromPersonController.text = widget.restriction.fromPerson;
    toPersonController.text = widget.restriction.toPerson;
    amountController.text = widget.restriction.amount.toString();
    descriptionController.text = widget.restriction.description;
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    fromPersonController.dispose();
    toPersonController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

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
            controller: fromPersonController,
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
            controller: toPersonController,
            hintText: 'اسم المشروع/العامل',
            keyboardType: TextInputType.text,
            readOnly: true,
          ),
          const SizedBox(height: 38),
          Column(
            spacing: 38,
            children: [
              CustomTextFormFeild(
                controller: dateController,
                isCalender: true,
                hintText: 'التاريخ',
                keyboardType: TextInputType.text,
                suffixIcon: SvgPicture.asset(Assets.imagesCalendar),
              ),
              CustomTextFormFeild(
                controller: amountController,
                hintText: 'المبلغ',
                keyboardType: TextInputType.number,
                suffixIcon: SvgPicture.asset(Assets.imagesDolarSign),
                onChanged: (value) {
                  amountController.text = value;
                },
              ),
              CustomTextFormFeild(
                controller: descriptionController,
                hintText: 'البيان',
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  descriptionController.text = value;
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
                log(
                  '${fromPersonController.text} - ${toPersonController.text} - ${dateController.text} - ${amountController.text} - ${descriptionController.text}',
                );
                Navigator.pop(context);
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

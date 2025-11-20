import 'dart:developer';

import 'package:daily_cash/core/helper/persons_provider.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AddRestrictionForm extends StatefulWidget {
  const AddRestrictionForm({super.key});

  @override
  State<AddRestrictionForm> createState() => _AddRestrictionFormState();
}

class _AddRestrictionFormState extends State<AddRestrictionForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController dateController = TextEditingController();
  TextEditingController fromPersonController = TextEditingController();
  TextEditingController toPersonController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PersonsProvider>(
        context,
        listen: false,
      ).clearSelectedPerson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, PersonsProvider personsProvider, child) {
        if (personsProvider.type == 'from' &&
            personsProvider.fromPerson != null) {
          fromPersonController.text = personsProvider.fromPerson!.name;
        }

        if (personsProvider.type == 'to' && personsProvider.toPerson != null) {
          toPersonController.text = personsProvider.toPerson!.name;
        }

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
                type: 'from',
                isPerson: true,
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
                type: 'to',
                isPerson: true,
                controller: toPersonController,
                hintText: 'اسم المشروع/العامل',
                keyboardType: TextInputType.text,
                readOnly: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 38),
              CustomTextFormFeild(
                isCalender: true,
                controller: dateController,
                readOnly: true,
                hintText: 'التاريخ',
                keyboardType: TextInputType.text,
                suffixIcon: SvgPicture.asset(Assets.imagesCalendar),
                onChanged: (value) {},
              ),
              const SizedBox(height: 38),
              CustomTextFormFeild(
                controller: amountController,
                hintText: 'المبلغ',
                keyboardType: TextInputType.number,
                suffixIcon: SvgPicture.asset(Assets.imagesDolarSign),
                onChanged: (value) {
                  amountController.text = value.toString();
                },
              ),
              const SizedBox(height: 38),
              CustomTextFormFeild(
                controller: descriptionController,
                hintText: 'البيان',
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  descriptionController.text = value;
                },
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                text: 'إنشاء',
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
      },
    );
  }
}

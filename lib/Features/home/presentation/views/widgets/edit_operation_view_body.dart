import 'dart:developer';

import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/core/helper/persons_provider.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/general_section_item.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class EditOperationViewBody extends StatefulWidget {
  const EditOperationViewBody({super.key, required this.operation});
  final OperationModel operation;
  @override
  State<EditOperationViewBody> createState() => _EditOperationViewBodyState();
}

class _EditOperationViewBodyState extends State<EditOperationViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController operationTypeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  bool isIncome = false;
  @override
  void dispose() {
    operationTypeController.dispose();
    dateController.dispose();
    personController.dispose();
    amountController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    operationTypeController.text = widget.operation.type;
    dateController.text = widget.operation.date;
    personController.text = widget.operation.title;
    amountController.text = widget.operation.amount.toString();
    detailsController.text = widget.operation.details;
    isIncome = widget.operation.type == 'income';
  }

  @override
  Widget build(BuildContext context) {
    operationTypeController.text = isIncome ? 'income' : 'outcome';
    return Consumer(
      builder: (context, PersonsProvider provider, child) {
        personController.text = provider.selectedPerson?.name ?? '';
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                CustomAppBar(title: 'تعديل العملية'),
                GeneralSectionItem(
                  isSelected: isIncome,
                  title: 'إيراد',
                  icon: Assets.imagesIncome,
                  hasSwitch: true,
                  onChanged: (value) {
                    if (value) {
                      setState(() {
                        operationTypeController.text = 'outcome';
                        isIncome = true;
                      });
                    }
                  },
                ),
                GeneralSectionItem(
                  isSelected: isIncome == false,
                  title: 'منصرف',
                  icon: Assets.imagesOutcome,
                  hasSwitch: true,
                  onChanged: (value) {
                    if (value) {
                      setState(() {
                        operationTypeController.text = 'outcome';
                        isIncome = false;
                      });
                    }
                  },
                ),
                Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    spacing: 30,
                    children: [
                      CustomTextFormFeild(
                        controller: operationTypeController,
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
                        onSaved: (value) {},
                      ),
                      CustomTextFormFeild(
                        controller: amountController,
                        suffixIcon: SvgPicture.asset(Assets.imagesDolarSign),
                        hintText: 'المبلغ',
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          amountController.text = value ?? '';
                        },
                      ),
                      CustomTextFormFeild(
                        controller: personController,
                        hintText: 'اسم العامل/المشروع',
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          personController.text = value ?? '';
                        },
                      ),
                      CustomTextFormFeild(
                        controller: detailsController,
                        hintText: 'البيان',
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          detailsController.text = value ?? '';
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
                              '${operationTypeController.text} - ${dateController.text} - ${amountController.text} - ${personController.text} - ${detailsController.text}',
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
      },
    );
  }
}

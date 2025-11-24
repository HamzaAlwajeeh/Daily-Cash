import 'dart:developer';

import 'package:daily_cash/Features/Persons/presentation/controller/add_person_cubit/add_person_cubit.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/add_person_cubit/add_person_state.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_all_persons_cubit/get_all_persons_cubit.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/person_type.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/helper/custom_toast_bar.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPersonBottomSheet extends StatefulWidget {
  const AddPersonBottomSheet({super.key});

  @override
  State<AddPersonBottomSheet> createState() => _AddPersonBottomSheetState();
}

class _AddPersonBottomSheetState extends State<AddPersonBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController personNameController = TextEditingController();
  TextEditingController personTypeController = TextEditingController();
  bool isEmployee = true;

  @override
  void dispose() {
    personNameController.dispose();
    personTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    personTypeController.text = isEmployee ? 'worker' : 'project';
    return BlocConsumer<AddPersonCubit, AddPersonState>(
      listener: (context, state) {
        if (state is AddPersonSuccess) {
          customToastBar(
            context: context,
            message: 'تم الإضافة بنجاح',
            icon: Icons.check_rounded,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
          BlocProvider.of<GetAllPersonsCubit>(context).getAllPersons();
          Navigator.pop(context);
        } else if (state is AddPersonFailure) {
          customToastBar(
            context: context,
            message: state.errorMessage,
            icon: Icons.close_rounded,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: 16.0,
              left: 16.0,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('جديد', style: TextStyles.bold18),
                  const SizedBox(height: 20),
                  PersonType(
                    title: 'عامل',
                    type: 'worker',
                    isSelected: isEmployee,
                    onChanged: (value) {
                      if (value) {
                        setState(() {
                          personTypeController.text = 'worker';
                          isEmployee = true;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  PersonType(
                    title: 'مشروع',
                    type: 'project',
                    isSelected: !isEmployee,
                    onChanged: (value) {
                      if (value) {
                        setState(() {
                          personTypeController.text = 'project';
                          isEmployee = false;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormFeild(
                    keyboardType: TextInputType.name,
                    controller: personNameController,
                    fillColor: AppColors.textFeilColor,
                    hintText: 'الإسم',
                    onChanged: (vale) {
                      personNameController.text = vale;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 40),
                  state is AddPersonLoading
                      ? const CustomLoadingIndicator()
                      : PrimaryButton(
                        text: 'إضافة',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            autovalidateMode = AutovalidateMode.disabled;
                            setState(() {});
                            BlocProvider.of<AddPersonCubit>(context).addPerson(
                              name: personNameController.text,
                              type: personTypeController.text,
                            );
                            log(
                              'Person Name: ${personNameController.text} , Person Type: ${personTypeController.text}',
                            );
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

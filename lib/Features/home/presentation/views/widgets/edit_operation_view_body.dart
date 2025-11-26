import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/presentation/controller/edit_operation_cubit/edit_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/edit_operation_cubit/edit_operation_state.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_incom_operations_cubit/get_incom_operations_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_outcom_operations_cubit%20copy/get_outcom_operations_cubit.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/helper/custom_toast_bar.dart';
import 'package:daily_cash/core/helper/persons_provider.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/general_section_item.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class EditOperationViewBody extends StatefulWidget {
  const EditOperationViewBody({super.key, required this.operation});
  final Operation operation;
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
  int personId = 0;
  int operationId = 0;
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
    personController.text = widget.operation.entityName;
    amountController.text = widget.operation.amount.toString();
    detailsController.text = widget.operation.description;
    isIncome = widget.operation.type == 'income';
    personId = widget.operation.entityId;
    operationId = widget.operation.id;

    Future.microtask(() {
      Provider.of<PersonsProvider>(
        context,
        listen: false,
      ).clearSelectedPerson();
    });
  }

  @override
  Widget build(BuildContext context) {
    operationTypeController.text = isIncome ? 'income' : 'expense';
    return BlocConsumer<EditOperationCubit, EditOperationState>(
      listener: (context, state) {
        if (state is EditOperationSuccess) {
          customToastBar(
            context: context,
            message: 'تم تعدل العملية بنجاح',
            icon: Icons.check,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
          context.read<GetAllOperationsCubit>().getAllOperationss();
          context.read<GetIncomOperationsCubit>().getIncomOperationss();
          context.read<GetOutcomOperationsCubit>().getOutcomOperationss();
          Navigator.pop(context);
        } else if (state is EditOperationFailure) {
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
        return Consumer(
          builder: (context, PersonsProvider provider, child) {
            if (provider.selectedPerson != null &&
                provider.selectedPerson!.name != personController.text) {
              personController.text = provider.selectedPerson!.name;
            }
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
                            operationTypeController.text = 'expense';
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
                            operationTypeController.text = 'expense';
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
                            controller: dateController,
                            readOnly: true,
                            isCalender: true,
                            suffixIcon: SvgPicture.asset(Assets.imagesCalendar),
                            hintText: 'التاريخ',
                            keyboardType: TextInputType.text,
                            onSaved: (value) {},
                          ),
                          CustomTextFormFeild(
                            controller: amountController,
                            suffixIcon: SvgPicture.asset(
                              Assets.imagesDolarSign,
                            ),
                            hintText: 'المبلغ',
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              amountController.text = value ?? '';
                            },
                          ),
                          CustomTextFormFeild(
                            isPerson: true,
                            readOnly: true,
                            controller: personController,
                            hintText: 'اسم العامل/المشروع',
                            keyboardType: TextInputType.text,
                            onSaved: (value) {},
                          ),
                          CustomTextFormFeild(
                            controller: detailsController,
                            hintText: 'البيان',
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              detailsController.text = value ?? '';
                            },
                          ),
                          state is EditOperationLoading
                              ? CustomLoadingIndicator()
                              : PrimaryButton(
                                text: 'تعديل',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    autovalidateMode =
                                        AutovalidateMode.disabled;
                                    setState(() {});
                                    BlocProvider.of<EditOperationCubit>(
                                      context,
                                    ).editOperation(
                                      id: operationId,
                                      type: operationTypeController.text,
                                      date: dateController.text,
                                      amount: double.parse(
                                        amountController.text,
                                      ),
                                      description: detailsController.text,
                                      personId: personId,
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
      },
    );
  }
}

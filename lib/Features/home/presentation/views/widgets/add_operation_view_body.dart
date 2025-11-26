import 'package:daily_cash/Features/home/presentation/controller/add_operation_cubit/add_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/add_operation_cubit/add_operation_state.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_cash_box_cubit/get_cash_box_cubit.dart';
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

class AddOperationViewBody extends StatefulWidget {
  const AddOperationViewBody({super.key});

  @override
  State<AddOperationViewBody> createState() => _AddOperationViewBodyState();
}

class _AddOperationViewBodyState extends State<AddOperationViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController operationTypeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  int personId = 0;

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
    return BlocConsumer<AddOperationCubit, AddOperationState>(
      listener: (context, state) {
        if (state is AddOperationSuccess) {
          customToastBar(
            context: context,
            message: 'تم إنشاء العملية بنجاح',
            icon: Icons.check,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
          context.read<GetAllOperationsCubit>().getAllOperationss();
          context.read<GetCashBoxCubit>().getCashBox();
          Navigator.pop(context);
        } else if (state is AddOperationFailure) {
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
            personController.text = provider.selectedPerson?.name ?? '';
            personId = provider.selectedPerson?.id ?? 0;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    CustomAppBar(title: 'إنشاء عملية'),
                    GeneralSectionItem(
                      isSelected: isIncome,
                      title: 'إيراد',
                      icon: Assets.imagesIncome,
                      hasSwitch: true,
                      onChanged: (value) {
                        if (value) {
                          setState(() {
                            operationTypeController.text = 'income';
                            isIncome = true;
                          });
                        }
                      },
                    ),
                    GeneralSectionItem(
                      isSelected: !isIncome,
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
                            suffixIcon: SvgPicture.asset(Assets.imagesCalendar),
                            hintText: 'التاريخ',
                            isCalender: true,
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
                              amountController.text = value ?? '0';
                            },
                          ),
                          CustomTextFormFeild(
                            controller: personController,
                            isPerson: true,
                            readOnly: true,
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
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                          state is AddOperationLoading
                              ? CustomLoadingIndicator()
                              : PrimaryButton(
                                text: 'إنشاء',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    autovalidateMode =
                                        AutovalidateMode.disabled;
                                    setState(() {});
                                    BlocProvider.of<AddOperationCubit>(
                                      context,
                                    ).addOperation(
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

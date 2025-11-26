import 'package:daily_cash/Features/Restrictions/presentation/views/controller/add_restriction_cubit/add_restriction_cubit.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/add_restriction_cubit/add_restriction_state.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/get_all_restrictions_cubit/get_all_restrictions_cubit.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/add_restriction_form.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/core/helper/custom_toast_bar.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRestrictionViewBody extends StatelessWidget {
  const AddRestrictionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddRestrictionCubit, AddRestrictionState>(
      listener: (context, state) {
        if (state is AddRestrictionSuccess) {
          customToastBar(
            context: context,
            message: 'تم إنشاء القيد بنجاح',
            icon: Icons.check,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
          context.read<GetAllRestrictionsCubit>().getAllRestrictions();
          Navigator.pop(context);
        } else if (state is AddRestrictionFailure) {
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
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(title: 'إنشاء قيد'),
                AddRestrictionForm(),
              ],
            ),
          ),
        );
      },
    );
  }
}

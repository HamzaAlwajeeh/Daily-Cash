import 'dart:io';

import 'package:daily_cash/Features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:daily_cash/Features/auth/presentation/controller/auth_cubit/auth_state.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/welcome_message_and_profile_info.dart';
import 'package:daily_cash/Features/profile/presentation/views/widgets/general_section.dart';
import 'package:daily_cash/Features/profile/presentation/views/widgets/general_summary.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/helper/custom_toast_bar.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/dialog_message.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutFailure) {
          customToastBar(
            context: context,
            message: state.errorMessage,
            icon: Icons.close_rounded,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
        } else if (state is LogoutSuccess) {
          customToastBar(
            context: context,
            message: 'تم تسجيل الخروج بنجاح!',
            icon: Icons.check_rounded,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
          Prefs.removeString('token');
          exit(0);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 70,
            bottom: 20,
          ),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('الحساب الشخصي', style: TextStyles.bold18),
              WelcomeMessageAndProfileInfo(
                title: 'حمزة الوجيه',
                subTitle: 'ha20mza60@gmail.com',
              ),
              GeneralSection(),
              Divider(color: AppColors.primaryColor),
              GeneralSummary(),
              Divider(color: AppColors.primaryColor),
              Spacer(),
              state is LogoutLoading
                  ? CustomLoadingIndicator()
                  : PrimaryButton(
                    text: 'تسجيل الخروج',
                    onPressed: () {
                      dialogMessage(
                        context: context,
                        okText: 'خروج',
                        cancleText: 'إلغاء',
                        message: 'هل ترغب في تسجيل الخروج ؟',
                        icon: SvgPicture.asset(Assets.imagesLogout),
                        onClickOk: () {
                          BlocProvider.of<AuthCubit>(context).logout();
                          Navigator.pop(context);
                        },
                      );
                    },
                    color: AppColors.customRed.withOpacity(0.7),
                    textColor: AppColors.textSecondaryColor,
                  ),
            ],
          ),
        );
      },
    );
  }
}

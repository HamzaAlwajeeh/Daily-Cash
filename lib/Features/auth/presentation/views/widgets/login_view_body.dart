import 'package:daily_cash/Features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:daily_cash/Features/auth/presentation/controller/auth_cubit/auth_state.dart';
import 'package:daily_cash/Features/auth/presentation/views/sign_up_view.dart';
import 'package:daily_cash/Features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/helper/custom_toast_bar.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/base_view.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          customToastBar(
            context: context,
            message: state.errorMessage,
            icon: Icons.close_rounded,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
        } else if (state is LoginSuccess) {
          debugPrint(state.user.toString());
          Prefs.setString('token', state.user.token);
          Prefs.setString('userName', state.user.name);
          Prefs.setString('email', state.user.email);
          Navigator.pushReplacementNamed(context, BaseView.routeName);
          customToastBar(
            context: context,
            message: 'مرحباً ${state.user.name}, تم تسجيل الدخول بنجاح!',
            icon: Icons.check_rounded,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70),
                Text('تسجيل الدخول', style: TextStyles.bold18),
                const SizedBox(height: 70),
                SvgPicture.asset(Assets.imagesLogin),
                Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      CustomTextFormFeild(
                        hintText: 'البريد الإلكتروني',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormFeild(
                        hintText: 'كلمة المرور',
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      if (state is LoginLoading)
                        CustomLoadingIndicator()
                      else
                        PrimaryButton(
                          text: 'تسجيل الدخول',
                          onPressed: () {
                            onLoginButtonPressed();
                          },
                        ),
                      const SizedBox(height: 20),
                      HaveAnAccount(
                        subText: 'لا تمتلك حساب؟',
                        primaryText: 'إنشاء حساب',
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            SignUpView.routeName,
                          );
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

  void onLoginButtonPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      setState(() {});
      BlocProvider.of<AuthCubit>(
        context,
      ).login(email: email, password: password);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

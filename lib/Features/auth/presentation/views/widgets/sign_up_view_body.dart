import 'dart:developer';

import 'package:daily_cash/Features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:daily_cash/Features/auth/presentation/controller/auth_cubit/auth_state.dart';
import 'package:daily_cash/Features/auth/presentation/views/login_view.dart';
import 'package:daily_cash/Features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/helper/custom_toast_bar.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SingUpFailure) {
          customToastBar(
            context: context,
            message: state.errorMessage,
            icon: Icons.close_rounded,
            backgroundColor: AppColors.textFeilSecondaryColor,
            textColor: AppColors.primaryColor,
          );
        } else if (state is SingUpSuccess) {
          log('User Registered Successfully');
          Navigator.pushReplacementNamed(context, LoginView.routeName);
          customToastBar(
            context: context,
            message: 'مرحباً , تم إنشاء حسابك بنجاح! , قم بتسجيل الدخول',
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
                Text('إنشاء حساب جديد', style: TextStyles.bold18),
                const SizedBox(height: 70),
                SvgPicture.asset(Assets.imagesSignup),
                Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      CustomTextFormFeild(
                        hintText: 'اسم المستخدم',
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          nameController.text = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormFeild(
                        hintText: 'البريد الإلكتروني',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          emailController.text = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormFeild(
                        hintText: 'كلمة المرور',
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        onChanged: (value) {
                          passwordController.text = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      if (state is SingUpLoading)
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
                        subText: 'تمتلك حساب بالفعل؟',
                        primaryText: 'تسجيل الدخول',
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            LoginView.routeName,
                          );
                        },
                      ),
                      const SizedBox(height: 50),
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
      BlocProvider.of<AuthCubit>(context).register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

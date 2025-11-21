import 'package:daily_cash/Features/auth/presentation/views/sign_up_view.dart';
import 'package:daily_cash/Features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/base_view.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
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
  }

  void onLoginButtonPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      setState(() {});
      Navigator.pushReplacementNamed(context, BaseView.routeName);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

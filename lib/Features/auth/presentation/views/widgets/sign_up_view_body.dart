import 'package:daily_cash/Features/auth/presentation/views/login_view.dart';
import 'package:daily_cash/Features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
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
  }

  void onLoginButtonPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      setState(() {});
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

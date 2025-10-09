import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
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
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  CustomTextFormFeild(
                    hintText: 'البريد الإلكتروني',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  // CustomTextFormFeild(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

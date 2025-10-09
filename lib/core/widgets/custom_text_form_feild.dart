import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.isPassword,
    this.onChanged,
  });
  final String hintText;
  final TextInputType keyboardType;
  final bool? isPassword;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        if (hintText == 'البريد الإلكتروني' &&
            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'الرجاء إدخال بريد إلكتروني صالح';
        }
        if (isPassword == true && value.length < 8) {
          return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
        }
        return null;
      },
      obscureText: isPassword ?? false,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon:
            isPassword ?? false
                ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 16),
                  child: Icon(Icons.visibility),
                )
                : null,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
        fillColor: AppColors.textFeilSecondaryColor,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide.none,
    );
  }
}

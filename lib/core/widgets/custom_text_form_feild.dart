import 'package:daily_cash/core/helper/get_data_function.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatefulWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.isPassword,
    this.onChanged,
    this.onSaved,
    this.initialValue,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
    this.isCalender,
  });
  final String hintText;
  final TextInputType keyboardType;
  final bool? isPassword;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final bool? isCalender;

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        if (widget.isCalender == true) {
          getDate(context).then((value) {
            widget.controller?.text = value;
          });
          setState(() {});
        }
      },
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        if (widget.hintText == 'البريد الإلكتروني' &&
            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'الرجاء إدخال بريد إلكتروني صالح';
        }
        if (widget.isPassword == true && value.length < 8) {
          return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
        }
        return null;
      },
      obscureText: widget.isPassword == true ? !isVisible : false,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon:
            widget.isPassword ?? false
                ? Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    icon:
                        !isVisible
                            ? Icon(
                              Icons.visibility,
                              color: AppColors.primaryColor,
                            )
                            : Icon(
                              Icons.visibility_off,
                              color: AppColors.primaryColor,
                            ),
                  ),
                )
                : GestureDetector(
                  onTap:
                      (widget.isCalender == true)
                          ? () async {
                            await getDate(context).then((value) {
                              widget.controller?.text = value;
                            });
                            setState(() {});
                          }
                          : null,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: widget.suffixIcon,
                  ),
                ),
        filled: true,
        hintText: widget.hintText,
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

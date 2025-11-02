import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixIconOnPressed,
    this.sufixIconOnPressed,
  });
  final String? hintText;
  final String? suffixIcon;
  final IconData? prefixIcon;
  final void Function()? prefixIconOnPressed;
  final void Function()? sufixIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon:
            suffixIcon != null
                ? Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child:
                      suffixIcon == null
                          ? Container()
                          : SvgPicture.asset(suffixIcon!),
                )
                : null,
        prefixIcon:
            prefixIcon != null
                ? Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(prefixIcon, color: AppColors.primaryColor),
                  ),
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

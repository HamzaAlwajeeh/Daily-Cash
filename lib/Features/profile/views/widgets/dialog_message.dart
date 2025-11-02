import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<void> showLogoutDialog({required BuildContext context , required VoidCallback onClickOk , required  String message , required Widget icon , required String okText , required String cancleText}) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // ما يختفي عند الضغط خارج النافذة
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(20),
        backgroundColor: AppColors.textFeilColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        icon: icon,
        content:  Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyles.bold16,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PrimaryButton(
                  text: okText,
                  color: AppColors.primaryColor,
                  onPressed: onClickOk,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PrimaryButton(
                  text: cancleText,
                  color: Color(0xffD8BAFF).withOpacity(0.4),
                  textColor: Color(0xffDBD3DF),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

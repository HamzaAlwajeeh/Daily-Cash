import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SwhitchWidget extends StatefulWidget {
  const SwhitchWidget({super.key});

  @override
  State<SwhitchWidget> createState() => _SwhitchWidgetState();
}

class _SwhitchWidgetState extends State<SwhitchWidget> {
  bool currentState = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.9,
      child: Switch(
        value: currentState,
        onChanged: (state) {
          currentState = state;
          setState(() {});
        },
        activeTrackColor: AppColors.primaryColor,
        activeColor: AppColors.buttonsThirdColor,
        inactiveTrackColor: Color(0xff888FA0),
        inactiveThumbColor: AppColors.textSecondaryColor,
      ),
    );
  }
}

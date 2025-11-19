import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SwhitchWidget extends StatefulWidget {
  const SwhitchWidget({
    super.key,
    required this.onChanged,
    required this.isSelected,
  });

  final ValueChanged<bool> onChanged;
  final bool isSelected;

  @override
  State<SwhitchWidget> createState() => _SwhitchWidgetState();
}

class _SwhitchWidgetState extends State<SwhitchWidget> {
  //widget.isSelected;
  @override
  Widget build(BuildContext context) {
    bool isChecked = widget.isSelected;
    return Transform.scale(
      scale: 0.9,
      child: Switch(
        value: isChecked,
        onChanged: (state) {
          isChecked = state;
          setState(() {});
          widget.onChanged(state);
        },
        activeTrackColor: AppColors.primaryColor,
        activeColor: AppColors.buttonsThirdColor,
        inactiveTrackColor: Color(0xff888FA0),
        inactiveThumbColor: AppColors.textSecondaryColor,
      ),
    );
  }
}

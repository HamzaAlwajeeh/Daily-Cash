import 'package:daily_cash/Features/profile/views/widgets/switch_widget.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GeneralSectionItem extends StatelessWidget {
  const GeneralSectionItem({
    super.key,
    required this.icon,
    required this.title,
    this.hasSwitch,
  });
  final String icon;
  final String title;
  final bool? hasSwitch;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.textFeilColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(icon),
            Text(
              title,
              style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
            ),
            Spacer(),
            Visibility(visible: hasSwitch ?? false, child: SwhitchWidget()),
          ],
        ),
      ),
    );
  }
}

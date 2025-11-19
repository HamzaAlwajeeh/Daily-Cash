import 'package:daily_cash/Features/profile/presentation/views/about_us_view.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GeneralSectionItem extends StatelessWidget {
  const GeneralSectionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.hasSwitch,
    this.onChanged,
    required this.isSelected,
  });
  final String icon;
  final String title;
  final bool hasSwitch;
  final ValueChanged<bool>? onChanged;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hasSwitch ? null : Navigator.pushNamed(context, AboutUsView.routeName);
      },
      child: Container(
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
                style: TextStyles.bold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(),
              Visibility(
                visible: hasSwitch,
                child: SwhitchWidget(
                  isSelected: isSelected,
                  onChanged: (state) {
                    onChanged!(state);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

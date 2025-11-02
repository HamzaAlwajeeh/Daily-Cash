import 'package:daily_cash/Features/profile/views/widgets/general_section_item.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('عام', style: TextStyles.bold16),
        ),
        GeneralSectionItem(
          title: 'الوضع الداكن',
          icon: Assets.imagesTheme,
          hasSwitch: true,
        ),
        GeneralSectionItem(title: 'نبذه عنا', icon: Assets.imagesAboutUs),
      ],
    );
  }
}

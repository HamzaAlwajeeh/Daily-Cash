import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/general_section_item.dart';
import 'package:flutter/material.dart';

class GeneralSection extends StatefulWidget {
  const GeneralSection({super.key});

  @override
  State<GeneralSection> createState() => _GeneralSectionState();
}

class _GeneralSectionState extends State<GeneralSection> {
  bool isDarkMode = true;
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
          isSelected: isDarkMode,
          title: 'الوضع الداكن',
          icon: Assets.imagesTheme,
          hasSwitch: true,
          onChanged: (value) {
            setState(() {
              isDarkMode = value;
            });
          },
        ),
        GeneralSectionItem(
          isSelected: false,
          title: 'نبذه عنا',
          icon: Assets.imagesAboutUs,
          hasSwitch: false,
        ),
      ],
    );
  }
}

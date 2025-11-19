import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonType extends StatefulWidget {
  const PersonType({
    super.key,
    required this.title,
    required this.type,
    required this.isSelected,
    this.onChanged,
  });

  final String title;
  final String type;
  final bool isSelected;
  final ValueChanged<bool>? onChanged;

  @override
  State<PersonType> createState() => _PersonTypeState();
}

class _PersonTypeState extends State<PersonType> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 80,
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  widget.type == 'employee'
                      ? Assets.imagesEmployee
                      : Assets.imagesProject,
                ),
              ),
              Text(
                widget.title,
                style: TextStyles.bold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(),
              SwhitchWidget(
                isSelected: widget.isSelected,
                onChanged: (state) {
                  widget.onChanged!(state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

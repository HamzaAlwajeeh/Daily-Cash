import 'package:daily_cash/Features/Persons/data/models/person_model.dart';
import 'package:daily_cash/Features/Persons/presentation/views/person_details_view.dart';
import 'package:daily_cash/Features/profile/views/widgets/switch_widget.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonItem extends StatelessWidget {
  const PersonItem({super.key, this.hasSwitch, required this.person});
  final PersonModel person;
  final bool? hasSwitch;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          PersonDetailsView.routeName,
          arguments: person,
        );
      },
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
                  person.type == 'employee'
                      ? Assets.imagesEmployee
                      : Assets.imagesProject,
                ),
              ),
              Text(
                person.name,
                style: TextStyles.bold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(),
              Visibility(visible: hasSwitch ?? false, child: SwhitchWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:daily_cash/Features/Persons/data/models/person_model.dart';
import 'package:daily_cash/Features/Persons/presentation/views/person_details_view.dart';
import 'package:daily_cash/core/helper/persons_provider.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PersonItem extends StatefulWidget {
  const PersonItem({
    super.key,
    this.hasSwitch,
    required this.person,
    this.isBottomSheet,
  });
  final bool? isBottomSheet;
  final PersonModel person;
  final bool? hasSwitch;

  @override
  State<PersonItem> createState() => _PersonItemState();
}

class _PersonItemState extends State<PersonItem> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isBottomSheet == true) {
          Provider.of<PersonsProvider>(
            context,
            listen: false,
          ).selectPerson(widget.person);
          Provider.of<PersonsProvider>(context, listen: false).count = counter;
          setState(() {
            counter++;
          });
          Navigator.pop(context);
        } else {
          Navigator.pushNamed(
            context,
            PersonDetailsView.routeName,
            arguments: widget.person,
          );
        }
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
                  widget.person.type == 'employee'
                      ? Assets.imagesEmployee
                      : Assets.imagesProject,
                ),
              ),
              Text(
                widget.person.name,
                style: TextStyles.bold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(),
              Visibility(
                visible: widget.hasSwitch ?? false,
                child: SwhitchWidget(isSelected: false, onChanged: (state) {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

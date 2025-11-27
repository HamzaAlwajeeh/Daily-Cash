import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/delete_person_cubit/delete_person_cubit.dart';
import 'package:daily_cash/Features/Persons/presentation/views/person_details_view.dart';
import 'package:daily_cash/core/helper/custom_toast_bar.dart';
import 'package:daily_cash/core/helper/persons_provider.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PersonItem extends StatelessWidget {
  const PersonItem({
    super.key,
    this.hasSwitch,
    required this.person,
    this.isBottomSheet,
  });
  final bool? isBottomSheet;
  final Person person;
  final bool? hasSwitch;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (context) {
              if (isBottomSheet == true) {
                customToastBar(
                  context: context,
                  message: 'لا يمكن الحذف من هنا',
                  icon: Icons.warning,
                  backgroundColor: AppColors.textFeilSecondaryColor,
                  textColor: AppColors.red,
                );
              } else {
                BlocProvider.of<DeletePersonCubit>(
                  context,
                ).deletePerson(id: person.id);
              }
            },
            backgroundColor: AppColors.red,
            borderRadius: BorderRadius.circular(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete, color: Colors.white, size: 30),
                SizedBox(height: 4),
                Text(
                  'حذف',
                  style: TextStyles.bold16.copyWith(
                    color: Colors.white,
                  ), // Text color
                ),
              ],
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          if (isBottomSheet == true) {
            Provider.of<PersonsProvider>(
              context,
              listen: false,
            ).selectPerson(person);
            Navigator.pop(context);
          } else {
            Navigator.pushNamed(
              context,
              PersonDetailsView.routeName,
              arguments: person,
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
                    person.type == 'worker'
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
                Visibility(
                  visible: hasSwitch ?? false,
                  child: SwhitchWidget(
                    isSelected: false,
                    onChanged: (state) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

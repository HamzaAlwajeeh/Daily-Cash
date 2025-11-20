import 'package:daily_cash/Features/Persons/data/models/person_model.dart';
import 'package:daily_cash/Features/Persons/data/test_person_data.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/persons_list_view.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

void showPersonsBottomSheet(context) => showModalBottomSheet(
  backgroundColor: AppColors.textFeilSecondaryColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  isScrollControlled: true,
  context: context,
  builder: (context) {
    return PersonsBottomSheet();
  },
);

class PersonsBottomSheet extends StatefulWidget {
  const PersonsBottomSheet({super.key});

  @override
  State<PersonsBottomSheet> createState() => _PersonsBottomSheetState();
}

class _PersonsBottomSheetState extends State<PersonsBottomSheet> {
  List<PersonModel> persons = [];

  @override
  void initState() {
    persons = getPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
      child: SizedBox(
        height: 500,
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFeild(
              hintText: 'البحث بالإسم...',
              suffixIcon: Assets.imagesFilter,
              fillColor: AppColors.textFeilColor,
            ),
            Expanded(
              child: PersonsListView(isBottomSheet: true, persons: persons),
            ),
          ],
        ),
      ),
    );
  }
}

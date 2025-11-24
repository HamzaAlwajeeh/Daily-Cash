import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_all_persons_cubit/get_all_persons_cubit.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/persons_list_view.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  List<Person> persons = [];

  @override
  void initState() {
    persons = BlocProvider.of<GetAllPersonsCubit>(context).personsList;
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

import 'package:daily_cash/Features/Persons/data/models/person_model.dart';
import 'package:daily_cash/Features/Persons/data/test_person_data.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/persons_list_view.dart';
import 'package:daily_cash/core/helper/no_search_found_message.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class PersonsHomeViewBody extends StatefulWidget {
  const PersonsHomeViewBody({super.key});

  @override
  State<PersonsHomeViewBody> createState() => _PersonsHomeViewBodyState();
}

class _PersonsHomeViewBodyState extends State<PersonsHomeViewBody> {
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
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('المشاريع والعمال', style: TextStyles.bold20),
          CustomTextFeild(
            hintText: 'البحث بالإسم...',
            suffixIcon: Assets.imagesFilter,
          ),
          if (persons.isEmpty)
            Expanded(
              child: NotSearchFoundMessage(
                message: 'عفوا... هذه المعلومات غير متوفرة',
              ),
            )
          else
            Expanded(child: PersonsListView(persons: persons)),
        ],
      ),
    );
  }
}

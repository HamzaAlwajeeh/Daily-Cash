import 'package:daily_cash/Features/Persons/data/models/person_model.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/person_item.dart';
import 'package:flutter/material.dart';

class PersonsListView extends StatelessWidget {
  const PersonsListView({super.key, this.isBottomSheet, required this.persons});
  final bool? isBottomSheet;
  final List<PersonModel> persons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemCount: persons.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: PersonItem(
            person: persons[index],
            isBottomSheet: isBottomSheet,
          ),
        );
      },
    );
  }
}

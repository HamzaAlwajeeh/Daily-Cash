import 'package:daily_cash/Features/Persons/data/test_person_data.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/person_item.dart';
import 'package:flutter/material.dart';

class PersonsListView extends StatefulWidget {
  const PersonsListView({super.key, this.isBottomSheet});
  final bool? isBottomSheet;
  @override
  State<PersonsListView> createState() => _PersonsListViewState();
}

class _PersonsListViewState extends State<PersonsListView> {
  List persons = [];

  @override
  void initState() {
    persons = getPersons();
    super.initState();
  }

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
            isBottomSheet: widget.isBottomSheet,
          ),
        );
      },
    );
  }
}

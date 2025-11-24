import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/person_details_body.dart';
import 'package:flutter/material.dart';

class PersonDetailsView extends StatelessWidget {
  const PersonDetailsView({super.key, required this.person});
  static const String routeName = '/person_details';
  final Person person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PersonDetailsBody(person: person));
  }
}

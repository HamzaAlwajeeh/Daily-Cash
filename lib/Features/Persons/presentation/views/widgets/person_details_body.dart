import 'package:daily_cash/Features/Persons/data/models/person_model.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class PersonDetailsBody extends StatelessWidget {
  const PersonDetailsBody({super.key, required this.person});
  final PersonModel person;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Text(person.name, style: TextStyles.bold18),
    );
  }
}

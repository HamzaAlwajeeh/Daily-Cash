import 'package:daily_cash/Features/Persons/presentation/views/widgets/persons_home_view_body.dart';
import 'package:flutter/material.dart';

class PersonsHomeView extends StatelessWidget {
  const PersonsHomeView({super.key});
  static const String routeName = '/persons_home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersonsHomeViewBody(),
    );
  }
}
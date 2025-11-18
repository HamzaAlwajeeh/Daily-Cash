import 'package:daily_cash/Features/Persons/presentation/views/persons_home_view.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/restrictions_view.dart';
import 'package:daily_cash/Features/home/presentation/views/home_view.dart';
import 'package:daily_cash/Features/profile/presentation/views/profile_view.dart';
import 'package:daily_cash/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});
  static const String routeName = '/base-view';
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentIndex = 0;

  final List<Widget> myScreens = [
    HomeView(),
    PersonsHomeView(),
    RestrictionsView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        onPressed: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}

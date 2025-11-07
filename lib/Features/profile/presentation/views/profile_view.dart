import 'package:daily_cash/Features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:daily_cash/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileViewBody(),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex1: 3),
    );
  }
}

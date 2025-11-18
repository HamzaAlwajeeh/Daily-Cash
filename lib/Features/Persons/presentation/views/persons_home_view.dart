import 'package:daily_cash/Features/Persons/presentation/views/widgets/add_person_bottom_sheet.dart';
import 'package:daily_cash/Features/Persons/presentation/views/widgets/persons_home_view_body.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PersonsHomeView extends StatelessWidget {
  const PersonsHomeView({super.key});
  static const String routeName = '/persons_home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersonsHomeViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customBottomSheet(context);
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.textFeilColor),
      ),
    );
  }

  Future<dynamic> customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.textFeilSecondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AddPersonBottomSheet();
      },
    );
  }
}

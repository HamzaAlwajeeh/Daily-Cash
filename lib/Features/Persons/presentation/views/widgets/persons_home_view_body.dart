import 'package:daily_cash/Features/Persons/presentation/views/widgets/persons_list_view.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class PersonsHomeViewBody extends StatelessWidget {
  const PersonsHomeViewBody({super.key});

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
          Expanded(child: PersonsListView()),
        ],
      ),
    );
  }
}

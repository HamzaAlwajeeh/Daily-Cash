import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/restrictions_list_view.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class RestrictionsViewBody extends StatelessWidget {
  const RestrictionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 16, top: 50),
      child: Column(
        spacing: 20,
        children: [
          Text('القيود المحاسبية', style: TextStyles.bold20),
          CustomTextFeild(
            hintText: 'البحث بالإسم...',
            suffixIcon: Assets.imagesFilter,
          ),
          Expanded(child: RestrictionsListView()),
        ],
      ),
    );
  }
}

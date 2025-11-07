import 'package:daily_cash/Features/Restrictions/data/models/restrictions_model.dart';
import 'package:daily_cash/Features/Restrictions/data/restrictions_data.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class RestrictionsListView extends StatefulWidget {
  const RestrictionsListView({super.key});

  @override
  State<RestrictionsListView> createState() => _RestrictionsListViewState();
}

class _RestrictionsListViewState extends State<RestrictionsListView> {
  List<RestrictionsModel> restrictions = [];
  @override
  void initState() {
    restrictions = getRestrictions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemCount: restrictions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: RestrictionsItem(restrictions: restrictions[index]),
        );
      },
    );
  }
}

class RestrictionsItem extends StatelessWidget {
  const RestrictionsItem({super.key, required this.restrictions});
  final RestrictionsModel restrictions;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.textFeilColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesExchangeWithBackground),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  style: TextStyles.bold16,
                  TextSpan(
                    text: 'من حساب ',
                    children: [
                      TextSpan(
                        text: restrictions.fromPerson,
                        style: TextStyles.bold16.copyWith(
                          color: AppColors.customRed,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  style: TextStyles.bold16,
                  TextSpan(
                    text: 'الى حساب ',
                    children: [
                      TextSpan(
                        text: restrictions.toPerson,
                        style: TextStyles.bold16.copyWith(
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  restrictions.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.regular14,
                ),
                Text(
                  restrictions.date,
                  style: TextStyles.bold14.copyWith(
                    color: AppColors.textSecondaryColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 103,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  restrictions.amount.round().toString(),
                  style: TextStyles.bold18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

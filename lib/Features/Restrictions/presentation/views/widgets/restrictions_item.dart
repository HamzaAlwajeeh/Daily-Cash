import 'package:daily_cash/Features/Restrictions/data/models/restrictions_model.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/edit_restriction_view.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class RestrictionsItem extends StatelessWidget {
  const RestrictionsItem({super.key, required this.restriction});
  final RestrictionsModel restriction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          EditRestrictionView.routeName,
          arguments: restriction,
        );
      },
      child: Container(
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
                          text: restriction.fromPerson,
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
                          text: restriction.toPerson,
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    restriction.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.regular14,
                  ),
                  Text(
                    restriction.date,
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
                    NumberFormat('#,###').format(restriction.amount.round()),
                    style: TextStyles.bold18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

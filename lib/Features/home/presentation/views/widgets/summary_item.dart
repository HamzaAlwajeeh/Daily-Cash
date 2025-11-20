import 'package:daily_cash/Features/home/presentation/views/income_operations_view.dart';
import 'package:daily_cash/Features/home/presentation/views/outcome_operations_view.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.amount, required this.type});
  final double amount;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          type == 'income'
              ? Navigator.pushNamed(context, IncomeOperationsView.routeName)
              : Navigator.pushNamed(context, OutcomeOperationsView.routeName);
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.textFeilSecondaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      type == 'income'
                          ? Assets.imagesIncome
                          : Assets.imagesOutcome,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      type == 'income' ? 'إيرادات' : 'مصروفات',
                      style: TextStyles.bold22.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      NumberFormat('#,###').format(amount.round()),
                      style: TextStyles.bold22,
                    ),
                    SvgPicture.asset(Assets.imagesReal),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/presentation/views/edit_operation_view.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class OperationItem extends StatelessWidget {
  const OperationItem({
    super.key,
    required this.operation,
    this.backgroundColor,
  });
  final Operation operation;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    double amount = double.parse(operation.amount.toString());
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          EditOperationView.routeName,
          arguments: operation,
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.textFeilSecondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              SvgPicture.asset(
                operation.type == 'income'
                    ? Assets.imagesIncome
                    : Assets.imagesOutcome,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text(
                      operation.entityName,
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      operation.description,
                      style: TextStyles.regular14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      operation.date,
                      style: TextStyles.bold14.copyWith(
                        color: AppColors.textSecondaryColor.withOpacity(0.5),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                width: 103,
                height: 40,
                decoration: BoxDecoration(
                  color:
                      operation.type == 'income'
                          ? AppColors.green.withOpacity(0.5)
                          : AppColors.customRed.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    NumberFormat('#,###').format(amount),
                    style: TextStyles.bold16,
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

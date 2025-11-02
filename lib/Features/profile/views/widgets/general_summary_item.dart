import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class GeneralSummaryItem extends StatelessWidget {
  const GeneralSummaryItem({
    super.key,
    required this.title,
    required this.count,
    required this.type,
  });
  final String title;
  final int count;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5),
        // height: 115,
        decoration: BoxDecoration(
          color: AppColors.textFeilSecondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: TextStyles.bold22),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color:
                    type == 'Employee'
                        ? AppColors.green.withOpacity(0.5)
                        : AppColors.customRed.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyles.bold24.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:daily_cash/Features/home/data/models/cash_box.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_cash_box_cubit/get_cash_box_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_cash_box_cubit/get_cash_box_state.dart';
import 'package:daily_cash/Features/home/presentation/views/all_operations_view.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({super.key, required this.totalAmount});
  final double totalAmount;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCashBoxCubit, GetCashBoxState>(
      builder: (context, state) {
        CashBox? cashBox = BlocProvider.of<GetCashBoxCubit>(context).cashBox;
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AllOperationsView.routeName);
          },
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'المبلغ في الخزينة',
                    style: TextStyles.bold16,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.textFeilSecondaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.imagesGreenMoney),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'المبلغ في الخزينه',
                              style: TextStyles.bold22.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  NumberFormat('#,###').format(
                                    double.parse(
                                      cashBox?.balance ?? '0',
                                    ).round(),
                                  ),
                                  style: TextStyles.bold24.copyWith(
                                    color:
                                        ((cashBox?.balance != null
                                                        ? double.tryParse(
                                                          cashBox!.balance,
                                                        )
                                                        : 0) ??
                                                    0) >
                                                0
                                            ? AppColors.green
                                            : AppColors.red,
                                  ),
                                ),
                                SvgPicture.asset(Assets.imagesReal),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

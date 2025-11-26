import 'package:daily_cash/Features/Persons/presentation/controller/get_all_persons_cubit/get_all_persons_cubit.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_all_persons_cubit/get_all_persons_state.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/general_summary_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralSummary extends StatelessWidget {
  const GeneralSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPersonsCubit, GetAllPersonsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('إحصائيات', style: TextStyles.bold16),
            ),
            Row(
              children: [
                GeneralSummaryItem(
                  title: 'عدد العمال',
                  count:
                      BlocProvider.of<GetAllPersonsCubit>(
                        context,
                      ).employeesCount,
                  type: 'green',
                ),
                const SizedBox(width: 10),
                GeneralSummaryItem(
                  title: 'عدد المشاريع',
                  count:
                      BlocProvider.of<GetAllPersonsCubit>(
                        context,
                      ).projectsCount,
                  type: 'red',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

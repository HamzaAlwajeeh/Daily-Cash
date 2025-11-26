import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/presentation/controller/delete_operation_cubit/delete_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/delete_operation_cubit/delete_operation_state.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_state.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/no_recent_operatios_widget.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/operations_list_view.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/today_summary.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllOperationsViewBody extends StatelessWidget {
  const AllOperationsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetAllOperationsCubit>(context).getAllOperationss();
    return BlocConsumer<DeleteOperationCubit, DeleteOperationState>(
      listener: (context, state) {
        if (state is DeleteOperationSuccess) {
          context.read<GetAllOperationsCubit>().getAllOperationss();
        }
      },
      builder: (context, state) {
        return BlocBuilder<GetAllOperationsCubit, GetAllOperationsState>(
          builder: (context, state) {
            List<Operation> operations =
                BlocProvider.of<GetAllOperationsCubit>(context).searchList;
            return Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 40),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(title: 'كل العمليات'),
                  CustomTextFeild(
                    hintText: 'البحث عن ...',
                    suffixIcon: Assets.imagesFilter,
                    onChanged: (value) {
                      BlocProvider.of<GetAllOperationsCubit>(
                        context,
                      ).searchOperation(value);
                    },
                  ),

                  TodaySummary(type: 'all', title: 'تفصيل العمليات'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('كل العمليات', style: TextStyles.bold16),
                  ),
                  if (state is GetAllOperationsLoading)
                    Expanded(child: CustomLoadingIndicator()),
                  if (state is GetAllOperationsFailure)
                    Center(child: Text(state.errorMessage)),
                  if (state is GetAllOperationsSuccess)
                    operations.isEmpty
                        ? Expanded(child: NoRecentOperatiosWidget())
                        : OperationsListView(operations: operations),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

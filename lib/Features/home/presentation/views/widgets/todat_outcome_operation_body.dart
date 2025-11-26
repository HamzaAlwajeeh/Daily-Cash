import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/presentation/controller/delete_operation_cubit/delete_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/delete_operation_cubit/delete_operation_state.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_incom_operations_cubit/get_incom_operations_state.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_outcom_operations_cubit/get_outcom_operations_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_outcom_operations_cubit/get_outcom_operations_state.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/no_recent_operatios_widget.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/operations_list_view.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodatOutcomeOperationViewBody extends StatelessWidget {
  const TodatOutcomeOperationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteOperationCubit, DeleteOperationState>(
      listener: (context, state) {
        if (state is DeleteOperationSuccess) {
          context.read<GetOutcomOperationsCubit>().getOutcomOperationss();
        }
      },
      builder: (context, state) {
        return BlocBuilder<GetOutcomOperationsCubit, GetOutcomOperationsState>(
          builder: (context, state) {
            List<Operation> outcomeOperations =
                BlocProvider.of<GetOutcomOperationsCubit>(
                  context,
                ).searchTodayOperations;
            return Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(title: 'الوارد'),
                  SizedBox(height: 10),
                  CustomTextFeild(
                    hintText: 'البحث عن ...',
                    suffixIcon: Assets.imagesFilter,
                    onChanged: (value) {
                      BlocProvider.of<GetOutcomOperationsCubit>(
                        context,
                      ).searchTodayOutcomeOperation(value);
                    },
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('كل الوارد', style: TextStyles.bold16),
                  ),
                  SizedBox(height: 10),
                  if (state is GetOutcomOperationsFailure)
                    Center(child: Text(state.errorMessage))
                  else if (state is GetIncomOperationsLoading)
                    Expanded(child: CustomLoadingIndicator())
                  else if (outcomeOperations.isEmpty)
                    Expanded(child: NoRecentOperatiosWidget())
                  else
                    OperationsListView(operations: outcomeOperations),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

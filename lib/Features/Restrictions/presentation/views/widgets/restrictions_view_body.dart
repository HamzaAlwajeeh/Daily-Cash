import 'package:daily_cash/Features/Restrictions/data/models/restriction/restriction.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/delete_restriction_cubit/delete_restriction_cubit.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/delete_restriction_cubit/delete_restriction_state.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/get_all_restrictions_cubit/get_all_restrictions_cubit.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/get_all_restrictions_cubit/get_all_restrictions_state.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/restrictions_list_view.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/no_recent_operatios_widget.dart';
import 'package:daily_cash/core/helper/custom_loading_indicator.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:daily_cash/core/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestrictionsViewBody extends StatelessWidget {
  const RestrictionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetAllRestrictionsCubit>(context).getAllRestrictions();
    return BlocConsumer<DeleteRestrictionCubit, DeleteRestrictionState>(
      listener: (context, state) {
        if (state is DeleteRestrictionSuccess) {
          context.read<GetAllRestrictionsCubit>().getAllRestrictions();
        }
      },
      builder: (context, state) {
        return BlocBuilder<GetAllRestrictionsCubit, GetAllRestrictionsState>(
          builder: (context, state) {
            List<Restriction> restrictions =
                BlocProvider.of<GetAllRestrictionsCubit>(context).restrictions;
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
                  if (state is GetAllRestrictionsLoading)
                    Expanded(child: CustomLoadingIndicator()),
                  if (state is GetAllRestrictionsFailure)
                    Center(child: Text(state.errorMessage)),
                  if (state is GetAllRestrictionsSuccess)
                    restrictions.isEmpty
                        ? Expanded(child: NoRecentOperatiosWidget())
                        : Expanded(
                          child: RestrictionsListView(
                            restrictions: restrictions,
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

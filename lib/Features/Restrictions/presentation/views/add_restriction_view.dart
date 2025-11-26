import 'package:daily_cash/Features/Restrictions/data/repos/restriction_repo_impl.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/add_restriction_cubit/add_restriction_cubit.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/add_restriction_view_body.dart';
import 'package:daily_cash/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRestrictionView extends StatelessWidget {
  const AddRestrictionView({super.key});
  static const String routeName = '/addRestrictionView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => AddRestrictionCubit(getIt<RestrictionRepoImpl>()),
        child: AddRestrictionViewBody(),
      ),
    );
  }
}

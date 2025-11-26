import 'package:daily_cash/Features/Restrictions/data/models/restriction/restriction.dart';
import 'package:daily_cash/Features/Restrictions/data/repos/restriction_repo_impl.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/edit_restriction_cubit/edit_restriction_cubit.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/widgets/edit_restriction_view_body.dart';
import 'package:daily_cash/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRestrictionView extends StatelessWidget {
  const EditRestrictionView({super.key, required this.restriction});
  static const String routeName = '/editRestrictionView';
  final Restriction restriction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => EditRestrictionCubit(getIt<RestrictionRepoImpl>()),
        child: EditRestrictionViewBody(restriction: restriction),
      ),
    );
  }
}

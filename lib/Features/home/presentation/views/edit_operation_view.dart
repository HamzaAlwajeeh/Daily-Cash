import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/data/repos/home_repo_impl.dart';
import 'package:daily_cash/Features/home/presentation/controller/edit_operation_cubit/edit_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/edit_operation_view_body.dart';
import 'package:daily_cash/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditOperationView extends StatelessWidget {
  const EditOperationView({super.key, required this.operation});
  static const String routeName = '/edit_operation';
  final Operation operation;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditOperationCubit(getIt<HomeRepoImpl>()),
      child: Scaffold(body: EditOperationViewBody(operation: operation)),
    );
  }
}

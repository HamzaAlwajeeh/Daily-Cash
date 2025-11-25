import 'package:daily_cash/Features/home/data/repos/home_repo_impl.dart';
import 'package:daily_cash/Features/home/presentation/controller/add_operation_cubit/add_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/add_operation_view_body.dart';
import 'package:daily_cash/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOperationView extends StatelessWidget {
  const AddOperationView({super.key});
  static const String routeName = '/add_operation';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOperationCubit(getIt<HomeRepoImpl>()),
      child: Scaffold(body: AddOperationViewBody()),
    );
  }
}

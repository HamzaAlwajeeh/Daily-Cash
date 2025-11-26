import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_cubit.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_cash_box_cubit/get_cash_box_cubit.dart';
import 'package:daily_cash/Features/home/presentation/views/add_operation_view.dart';
import 'package:daily_cash/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:daily_cash/core/widgets/custom_floating_action_buttomn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<GetAllOperationsCubit>(context).getAllOperationss();
    BlocProvider.of<GetCashBoxCubit>(context).getCashBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      floatingActionButton: CustomFloatingActionButtomn(
        onPressed: () {
          Navigator.pushNamed(context, AddOperationView.routeName);
        },
      ),
    );
  }
}

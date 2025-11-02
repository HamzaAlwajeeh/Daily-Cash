import 'package:daily_cash/Features/Splash/views/splash_view.dart';
import 'package:daily_cash/Features/auth/views/login_view.dart';
import 'package:daily_cash/Features/auth/views/sign_up_view.dart';
import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/views/all_operations_view.dart';
import 'package:daily_cash/Features/home/views/home_view.dart';
import 'package:daily_cash/Features/home/views/income_operations_view.dart';
import 'package:daily_cash/Features/home/views/operation_details_view.dart';
import 'package:daily_cash/Features/home/views/outcome_operations_view.dart';
import 'package:daily_cash/Features/onBoarding/views/on_boarding_view.dart';
import 'package:daily_cash/Features/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AllOperationsView.routeName:
      return MaterialPageRoute(builder: (context) => const AllOperationsView());
    case IncomeOperationsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const IncomeOperationsView(),
      );
    case OperationDetailsView.routeName:
        final operation = settings.arguments as OperationModel;
      return MaterialPageRoute(
        builder: (context) => OperationDetailsView(operation: operation,),
      );
      case ProfileView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProfileView(),
      );
    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}

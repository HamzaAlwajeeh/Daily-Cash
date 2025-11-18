import 'package:daily_cash/Features/Persons/data/models/person_model.dart';
import 'package:daily_cash/Features/Persons/presentation/views/person_details_view.dart';
import 'package:daily_cash/Features/Persons/presentation/views/persons_home_view.dart';
import 'package:daily_cash/Features/Restrictions/data/models/restrictions_model.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/add_restriction_view.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/edit_restriction_view.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/restrictions_view.dart';
import 'package:daily_cash/Features/Splash/presentation/views/splash_view.dart';
import 'package:daily_cash/Features/auth/presentation/views/login_view.dart';
import 'package:daily_cash/Features/auth/presentation/views/sign_up_view.dart';
import 'package:daily_cash/Features/home/data/models/operation_model.dart';
import 'package:daily_cash/Features/home/presentation/views/add_operation_view.dart';
import 'package:daily_cash/Features/home/presentation/views/all_operations_view.dart';
import 'package:daily_cash/Features/home/presentation/views/edit_operation_view.dart';
import 'package:daily_cash/Features/home/presentation/views/home_view.dart';
import 'package:daily_cash/Features/home/presentation/views/income_operations_view.dart';
import 'package:daily_cash/Features/home/presentation/views/outcome_operations_view.dart';
import 'package:daily_cash/Features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:daily_cash/Features/profile/presentation/views/about_us_view.dart';
import 'package:daily_cash/Features/profile/presentation/views/profile_view.dart';
import 'package:daily_cash/core/widgets/base_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // splash and onBoarding routes
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    // Auth routes
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());

    //Base of all Screens
    case BaseView.routeName:
      return MaterialPageRoute(builder: (context) => const BaseView());

    // home routes
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AllOperationsView.routeName:
      return MaterialPageRoute(builder: (context) => const AllOperationsView());
    case IncomeOperationsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const IncomeOperationsView(),
      );
    case OutcomeOperationsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OutcomeOperationsView(),
      );
    case AddOperationView.routeName:
      return MaterialPageRoute(builder: (context) => AddOperationView());
    case EditOperationView.routeName:
      final operation = settings.arguments as OperationModel;
      return MaterialPageRoute(
        builder: (context) => EditOperationView(operation: operation),
      );

    //profile routes
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case AboutUsView.routeName:
      return MaterialPageRoute(builder: (context) => const AboutUsView());

    //persons routes
    case PersonsHomeView.routeName:
      return MaterialPageRoute(builder: (context) => const PersonsHomeView());
    case PersonDetailsView.routeName:
      final person = settings.arguments as PersonModel;
      return MaterialPageRoute(
        builder: (context) => PersonDetailsView(person: person),
      );

    //Restrictions routes
    case RestrictionsView.routeName:
      return MaterialPageRoute(builder: (context) => const RestrictionsView());
    case AddRestrictionView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AddRestrictionView(),
      );
    case EditRestrictionView.routeName:
      final restriction = settings.arguments as RestrictionsModel;
      return MaterialPageRoute(
        builder: (context) => EditRestrictionView(restriction: restriction),
      );

    //default route
    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}

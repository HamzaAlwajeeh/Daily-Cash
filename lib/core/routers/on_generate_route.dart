import 'package:daily_cash/Features/Splash/views/splash_view.dart';
import 'package:daily_cash/Features/onBoarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}

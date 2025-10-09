import 'package:daily_cash/Features/auth/views/login_view.dart';
import 'package:daily_cash/Features/onBoarding/views/on_boarding_view.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigatorToOnBoarding(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(Assets.imagesLogo, width: 264));
  }

  void navigatorToOnBoarding(BuildContext context) async {
    bool seenOnBoarding = Prefs.getBool('seenOnBoarding');
    await Future.delayed(const Duration(seconds: 3));
    if (seenOnBoarding) {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  }
}

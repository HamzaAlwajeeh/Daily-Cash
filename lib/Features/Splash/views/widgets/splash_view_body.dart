import 'package:daily_cash/Features/onBoarding/views/on_boarding_view.dart';
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
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
  }
}

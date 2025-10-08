import 'package:daily_cash/Features/onBoarding/views/on_boarding_view.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Center(child: SvgPicture.asset(Assets.imagesSplash));
  }

  void navigatorToOnBoarding(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
  }
}

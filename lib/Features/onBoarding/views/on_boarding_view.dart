import 'package:daily_cash/Features/onBoarding/views/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'onBoarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnBoardingBody());
  }
}

import 'package:daily_cash/Features/onBoarding/views/widgets/on_boarding_page_view.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        children: [
          Expanded(child: OnBoardingPageView(pageController: pageController)),
          DotsIndicator(
            dotsCount: 3,
            position: 0,
            decorator: DotsDecorator(
              activeSize: const Size.square(12),
              size: const Size.square(12),
              activeColor: AppColors.primaryColor,
              color: AppColors.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

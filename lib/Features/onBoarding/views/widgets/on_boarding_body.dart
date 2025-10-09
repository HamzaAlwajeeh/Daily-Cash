import 'package:daily_cash/Features/auth/views/login_view.dart';
import 'package:daily_cash/Features/onBoarding/views/widgets/on_boarding_page_view.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/widgets/primary_button.dart';
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
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              final isActive = index <= currentPage;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isActive
                          ? AppColors.primaryColor
                          : AppColors.textSecondaryColor,
                ),
              );
            }),
          ),
          const SizedBox(height: 93),
          Visibility(
            visible: currentPage == 2,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 52 - 16),
              child: PrimaryButton(
                text: 'إبدأ',
                onPressed: () {
                  Prefs.setBool('seenOnBoarding', true);
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                },
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

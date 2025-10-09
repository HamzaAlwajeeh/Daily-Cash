import 'package:daily_cash/Features/onBoarding/views/widgets/on_boeardin_text_title.dart';
import 'package:daily_cash/Features/onBoarding/views/widgets/page_view_item.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          currentPage: 0,
          isVisable: true,
          image: Assets.imagesOnBoardingLogo,
          title: OnBoardingTextTitle(),
          subTitle: 'حيث السهوله والأمان',
        ),
        PageViewItem(
          isVisable: true,
          image: Assets.imagesOnBoarding2,
          subTitle: '''
تابع مصاريف مشاريعك بسهولة
 وسجّل كل حركة مالية لحظة بلحظة
''',
        ),
        PageViewItem(
          isVisable: false,
          image: Assets.imagesOnBoarding3,
          subTitle: '''
احصل على تقارير تفصيلية توضح أرباحك ومصاريفك، وحمّل كشوف الحساب بضغطة زر
''',
        ),
      ],
    );
  }
}

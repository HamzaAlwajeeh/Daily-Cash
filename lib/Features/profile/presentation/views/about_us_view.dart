import 'package:daily_cash/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});
  static const String routeName = '/about_us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          children: [
            CustomAppBar(title: 'نبذه عنا'),
            const SizedBox(height: 30),

            /// النص الأساسي كما هو
            Text.rich(
              textAlign: TextAlign.center,
              style: TextStyles.bold16,

              TextSpan(
                text: '''
يهدف هذا التطبيق إلى مساعدة الأفراد وأصحاب المشاريع على إدارة حساباتهم ومتابعة مصاريفهم وأجور العمال بكل سلاسة، من خلال بيئة عمل ذكية تمكّن المستخدم من تتبع كل عملية مالية، إنشاء تقارير فورية، وتحميل كشوفات تفصيلية في أي وقت.
''',
              ),
            ),

            const SizedBox(height: 20),

            /// فقرة فريق العمل
            Text(
              'فريق العمل :\n'
              'حمزة يحيى الوجيه\n'
              'محمد فايز باشامخه\n'
              'عمار محسن غزي\n'
              'عمر سالم بوعيران',
              textAlign: TextAlign.center,
              style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
            ),

            const SizedBox(height: 30),

            /// بطاقات التواصل
            CustomSocialCard(
              image: Assets.imagesGithub,
              title: 'https://github.com/HamzaAlwajeeh',
            ),
            const SizedBox(height: 20),
            CustomSocialCard(image: Assets.imagesCall, title: "771-832-796"),
          ],
        ),
      ),
    );
  }
}

class CustomSocialCard extends StatelessWidget {
  const CustomSocialCard({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.textFeilColor,
      ),
      child: Row(
        children: [
          SvgPicture.asset(image),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}

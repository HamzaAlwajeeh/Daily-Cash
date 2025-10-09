import 'package:daily_cash/Features/onBoarding/views/widgets/skip_button.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    this.title,
    required this.subTitle,
    required this.isVisable,
    required this.image,
    this.currentPage,
  });
  final bool isVisable;
  final Widget? title;
  final String subTitle;
  final String image;
  final int? currentPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SizedBox(
        height: 565,
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: isVisable,
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  child: SkipButton(),
                ),
              ],
            ),
            Spacer(),
            currentPage != null
                ? Image.asset(image, width: 287)
                : SvgPicture.asset(image, width: 287),
            const SizedBox(height: 20),
            title ?? SizedBox.shrink(),
            const SizedBox(height: 4),
            Text(
              textAlign: TextAlign.center,
              subTitle,
              maxLines: 2,
              style: TextStyles.bold16.copyWith(
                color: AppColors.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

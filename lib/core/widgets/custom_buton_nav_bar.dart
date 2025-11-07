import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonNavBar extends StatelessWidget {
  const CustomButtonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      height: 70,
      decoration: ShapeDecoration(
        color: AppColors.textFeilColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 7,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          InActiveIrem(image: Assets.imagesHome),
          InActiveIrem(image: Assets.images3users),
          InActiveIrem(image: Assets.imagesExchange),
          InActiveIrem(image: Assets.imagesUser),
        ],
      ),
    );
  }
}

class InActiveIrem extends StatelessWidget {
  const InActiveIrem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}

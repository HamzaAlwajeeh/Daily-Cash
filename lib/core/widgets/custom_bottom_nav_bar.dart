import 'package:daily_cash/core/entities/bottom_nav_bar_entity.dart';
import 'package:daily_cash/core/utils/app_colors.dart';
import 'package:daily_cash/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, required this.onPressed});
  final Function(int) onPressed;
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            bottmNavigatorBarItems
                .asMap()
                .entries
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      currentIndex = e.key;
                      setState(() {});
                      widget.onPressed(e.key);
                    },
                    child: NavigationBarItem(
                      item: e.value,
                      isSlected: currentIndex == e.key,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSlected,
    required this.item,
  });
  final BottomNavBarEntity item;
  final bool isSlected;
  @override
  Widget build(BuildContext context) {
    return isSlected
        ? ActiveItem(image: item.activeImage, name: item.name)
        : InActiveItem(image: item.inActiveImage);
  }
}

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114,
      height: 40,
      decoration: ShapeDecoration(
        color: const Color(0xFF544761),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: SvgPicture.asset(image)),
          ),
          const SizedBox(width: 6),
          Text(name, style: TextStyles.bold16),
        ],
      ),
    );
  }
}

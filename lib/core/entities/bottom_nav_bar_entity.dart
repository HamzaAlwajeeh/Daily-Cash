import 'package:daily_cash/core/utils/app_images.dart';

class BottomNavBarEntity {
  final String name;
  final String inActiveImage, activeImage;
  BottomNavBarEntity({
    required this.name,
    required this.inActiveImage,
    required this.activeImage,
  });
}

List<BottomNavBarEntity> get bottmNavigatorBarItems => [
  BottomNavBarEntity(
    name: 'الرئيسية',
    inActiveImage: Assets.imagesHome,
    activeImage: Assets.imagesHomeActive,
  ),
  BottomNavBarEntity(
    name: 'الأشخاص',
    inActiveImage: Assets.images3users,
    activeImage: Assets.images3usersActive,
  ),
  BottomNavBarEntity(
    name: 'القيود',
    inActiveImage: Assets.imagesExchange,
    activeImage: Assets.imagesExchangeActive,
  ),
  BottomNavBarEntity(
    name: 'حسابي',
    inActiveImage: Assets.imagesUser,
    activeImage: Assets.imagesUserActive,
  ),
];

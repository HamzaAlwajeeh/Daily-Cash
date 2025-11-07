import 'package:daily_cash/core/utils/app_images.dart';

class ButtomNavBarEntity {
  final String name;
  final String inActiveImage, activeImage;
  ButtomNavBarEntity({
    required this.name,
    required this.inActiveImage,
    required this.activeImage,
  });

  List<ButtomNavBarEntity> get bottmNavigatorBarItems => [
    ButtomNavBarEntity(
      name: 'الرئيسية',
      inActiveImage: Assets.imagesHome,
      activeImage: Assets.imagesHomeActive,
    ),
    ButtomNavBarEntity(
      name: 'الأشخاص',
      inActiveImage: Assets.images3users,
      activeImage: Assets.images3usersActive,
    ),
    ButtomNavBarEntity(
      name: 'القيود',
      inActiveImage: Assets.imagesExchange,
      activeImage: Assets.imagesExchangeActive,
    ),
    ButtomNavBarEntity(
      name: 'حسابي',
      inActiveImage: Assets.imagesUser,
      activeImage: Assets.imagesUserActive,
    ),
  ];
}

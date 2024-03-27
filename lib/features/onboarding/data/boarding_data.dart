import 'package:streamx/core/constants/assets.dart';

class OnBoardinData {
  final String title;
  final String subTitle;
  final String imageUrl;

  OnBoardinData(this.title, this.subTitle, this.imageUrl);
}

final List<OnBoardinData> onBoardingData = [
  OnBoardinData(
    'Watching can be from anywhere',
    'We help people connect with store \naround United State of America',
    Assets.imagesOnBoardingFourjpg,
  ),
  OnBoardinData(
    'Complete list of movies',
    'Show the store which are near you \nand get the best price',
    Assets.imagesOnBoardingFive,
  ),
  OnBoardinData(
    'Spent Time with Loved Ones!',
    'We show the products with the best \nquality and price',
    Assets.imagesOnboardingTwo,
  ),
];

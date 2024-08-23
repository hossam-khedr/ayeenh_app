import 'package:ayeenh/core/utilities/svg_icons.dart';

class OnBoardingModel{
  String title;
  String subTitle;
  String image;
  OnBoardingModel({required this.title,required this.subTitle,required this.image});

  static List<OnBoardingModel>getDataModel = [
    OnBoardingModel(title: 'any title', subTitle: 'any subTitle', image: PngIcons.banner),
    OnBoardingModel(title: 'any title', subTitle: 'any subTitle', image: PngIcons.banner2),
    OnBoardingModel(title: 'any title', subTitle: 'any subTitle', image: PngIcons.banner3),
  ];
}
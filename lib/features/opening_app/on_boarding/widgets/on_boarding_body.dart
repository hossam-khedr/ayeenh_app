import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBody extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingBody(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(widget.image),
        Text(widget.title,style: AppStyles.onBoardingTitleStyle()),
        Text(widget.subTitle,style: AppStyles.onBoardingSubTitleStyle()),
      ],
    );
  }
}

import 'package:ayeenh/core/utilities/app_routes.dart';
import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:ayeenh/features/opening_app/data/models/on_boarding_model.dart';
import 'package:ayeenh/features/opening_app/on_boarding/widgets/on_boarding_body.dart';
import 'package:ayeenh/features/opening_app/on_boarding/widgets/on_boarding_indecator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_buttons.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int pageNum = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MainAppScaffold(
      changeToolbarColor: false,
      shooAppBar: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSized.horizontalPaddingConst,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: PageView.builder(
                itemCount: OnBoardingModel.getDataModel.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    pageNum = index;
                  });
                },
                itemBuilder: (context, index) {
                  for (int i = 0;
                      i < OnBoardingModel.getDataModel.length;
                      i++) {
                    return OnBoardingBody(
                      title: OnBoardingModel.getDataModel[index].title,
                      subTitle: OnBoardingModel.getDataModel[index].subTitle,
                      image: OnBoardingModel.getDataModel[index].image,
                    );
                  }
                  return null;
                },
              ),
            ),
            OnBoardingIndicator(
              pageNum: pageNum,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButtons.normal(
                title: 'next'.tr(),

                onTap: () {
                  if (pageNum == OnBoardingModel.getDataModel.length - 1) {
                    Navigator.pushReplacementNamed(context, RoutesName.auth);
                  } else {
                    pageNum++;
                    pageController.animateToPage(
                      pageNum,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                    );
                  }
                }),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesName.auth);
              },
              child: Text('skip'.tr(),style: AppStyles.textButtonStyle(),),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}

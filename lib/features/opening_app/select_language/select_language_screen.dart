import 'package:ayeenh/core/utilities/app_routes.dart';
import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/utilities/svg_icons.dart';
import 'package:ayeenh/core/widgets/custom_buttons.dart';
import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/enums.dart';
import 'language_widget.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  LanguageType? languageType;

  @override
  Widget build(BuildContext context) {
    return MainAppScaffold(
      shooAppBar: false,
      changeToolbarColor: false,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSized.horizontalPaddingConst),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: SvgPicture.asset(
                  SvgIcons.appLogoIcon,
                  color: AppColors.bluColor,
                  height: 70.h,
                ),
              ),
            //  const Spacer(),
              SizedBox(height: 100.h,),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'select_language_app'.tr(),
                  style: AppStyles.titleStyle(),
                ),
              ),
              AppSizedBox.sizeBoxH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LanguageWidget(
                    isSelected: languageType==LanguageType.arabic?true:false,
                    onTap: (){
                      setState(() {
                        languageType =LanguageType.arabic;
                      });
                    },
                    image: SvgIcons.egIcon,
                    title: 'العربية',
                  ),
                  LanguageWidget(
                    isSelected: languageType ==LanguageType.english?true:false,
                    onTap: (){
                      setState(() {
                        languageType = LanguageType.english;
                      });
                    },
                    image: SvgIcons.usIcon,
                    title: 'English',
                  ),
                ],
              ),
             const Spacer(),
              CustomButtons.normal(title: 'next'.tr(), onTap: (){
                //todo save app language in local and navigate to next screen
                context.go( RoutesName.onBoarding);
              }),
              AppSizedBox.sizeBoxH20
            ],
          ),
        ),
      ),
    );
  }
}

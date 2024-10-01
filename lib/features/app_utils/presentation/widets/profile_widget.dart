import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_sized_box.dart';
import '../../../../core/utilities/app_styles.dart';
import '../../../../core/utilities/svg_icons.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
          color: AppColors.whitColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgIcons.profileIcon,
            height: 50.h,
            color: AppColors.bluColor,
          ),
          Text('حسام خضر',style: AppStyles.titleStyle(),),
          Text('hossam@gmail.com',style: AppStyles.subTitleStyle(),),
          AppSizedBox.sizeBoxH10,
          Container(
            alignment: AlignmentDirectional.center,
            width: 150.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: AppColors.bluColor,
                borderRadius: BorderRadius.circular(30.r)),
            child: Text(
              'edit_profile'.tr(),
              style: AppStyles.subTitleStyle().copyWith(
                color: AppColors.whitColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

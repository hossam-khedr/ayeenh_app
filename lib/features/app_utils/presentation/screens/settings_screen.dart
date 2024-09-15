import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/utilities/svg_icons.dart';
import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:ayeenh/features/app_utils/presentation/widets/profile_widget.dart';
import 'package:ayeenh/features/app_utils/presentation/widets/setting_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utilities/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return MainAppScaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSized.horizontalPaddingConst),
        child: Column(
          children: [
            const ProfileWidget(),
            AppSizedBox.sizeBoxH20,
            Container(
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                  color: AppColors.gryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                children: [
                  SettingItemWidget(
                    onTap: (){},
                    title: 'change_theme',
                    iconPath: SvgIcons.themeIcon,
                  ),
                  SettingItemWidget(
                    onTap: (){},
                    title: 'language',
                    iconPath: SvgIcons.globalIcon,
                  ),
                  SettingItemWidget(
                    onTap: (){},
                    title: 'notification',
                    iconPath: SvgIcons.notificationIcon,
                  ),
                ],
              ),
            ),
            AppSizedBox.sizeBoxH20,
            TextButton(
              onPressed: () {},
              child: Text(
                'Logout',
                style: AppStyles.titleStyle()
                    .copyWith(color: AppColors.bluColor, fontSize: 16.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}

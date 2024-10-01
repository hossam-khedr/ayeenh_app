import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_sized_box.dart';
import '../../../../../core/utilities/app_styles.dart';
import '../../../../../core/utilities/svg_icons.dart';
import '../../../../app_utils/presentation/widets/profile_widget.dart';
import '../../../../app_utils/presentation/widets/setting_item_widget.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileWidget(),
        AppSizedBox.sizeBoxH20,
        Container(
          width: double.infinity,
          height: 300.h,
          decoration: BoxDecoration(
              color: AppColors.whitColor,
              borderRadius: BorderRadius.circular(20.r)),
          child: ListView(
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
              const TestLogOutWidget()
            ],
          ),
        ),
      ],
    );
  }
}

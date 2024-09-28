import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/utilities/svg_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingItemWidget extends StatefulWidget {
  final String iconPath;
  final String title;
  final void Function()? onTap;

  const SettingItemWidget(
      {super.key, required this.iconPath, required this.title, this.onTap});

  @override
  State<SettingItemWidget> createState() => _SettingItemWidgetState();
}

class _SettingItemWidgetState extends State<SettingItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      leading: SvgPicture.asset(
        widget.iconPath,
        color: AppColors.bluColor,
      ),
      title: Text(
        widget.title.tr(),
        style: AppStyles.subTitleStyle().copyWith(color: AppColors.bluColor),
      ),
      trailing: const Icon(
        Icons.arrow_forward_rounded,
        color: AppColors.bluColor,
      ),
    );
  }
}

class TestLogOutWidget extends StatelessWidget {
  const TestLogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.logout_outlined,
        color: AppColors.bluColor,
      ),
      title: Text(
        'logout'.tr(),
        style: AppStyles.subTitleStyle().copyWith(
          color: AppColors.bluColor,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_rounded,
        color: AppColors.bluColor,
      ),
    );
  }
}

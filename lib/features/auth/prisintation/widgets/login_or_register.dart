import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/enums.dart';
import 'auth_widget.dart';

class LoginOrRegister extends StatefulWidget {
    final AuthType authType;
    final void Function()? loginOnTap;
    final void Function()? registerOnTap;
    const LoginOrRegister({super.key, required this.authType, this.loginOnTap, this.registerOnTap, });

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.h,
      decoration: BoxDecoration(
        color:widget. authType == AuthType.register
            ? AppColors.bluColor.withOpacity(0.2)
            : AppColors.whitColor,
        borderRadius: BorderRadius.circular(AppSized.constantRadius),
        border: Border.all(
          color: AppColors.bluColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AuthWidget(
            isSelected:widget. authType == AuthType.login ? true : false,
            onTap:widget.loginOnTap,
            title: 'login'.tr(),
          ),
          AuthWidget(
            isSelected:widget. authType == AuthType.register ? true : false,
            onTap: widget.registerOnTap,
            title: 'register'.tr(),
          ),
        ],
      ),
    );
  }
}

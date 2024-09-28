import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/widgets/custom_buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../logic/cubit.dart';
import 'handel_login_state.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.w),
        width: double.infinity,
        height: 250.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.bluColor.withOpacity(0.2)
        ),
        child: Column(
          children: [
            CustomTextFormField(
              controller: cubit.loginEmailController,
              hint: 'email'.tr(),
            ),
            AppSizedBox.sizeBoxH10,
            CustomTextFormField(
              isPass: true,
              controller: cubit.loginPasswordController,
              hint: 'password'.tr(),
            ),
            AppSizedBox.sizeBoxH10,
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                child: Text(
                  'forgot_password'.tr(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkGryColor),
                ),
                onPressed: () {},
              ),
            ),
            AppSizedBox.sizeBoxH10,
            const HandelLoginState(),
          ],
        ),
      ),
    );
  }
}

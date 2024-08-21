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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'welcome_back'.tr(),
          style: AppStyles.titleStyle(),
        ),
        Text(
          'you_login_from_new'.tr(),
          style: AppStyles.subTitleStyle(),
        ),
        AppSizedBox.sizeBoxH20,
        CustomTextFormField(
          controller: cubit.emailController,
          hint: 'email'.tr(),
        ),
        AppSizedBox.sizeBoxH20,
        CustomTextFormField(
          isPass: true,
          controller: cubit.passwordController,
          hint: 'password'.tr(),
        ),
        AppSizedBox.sizeBoxH20,
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton(
            child: Text(
              'forgot_password'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.favorite),
            ),
            onPressed: () {},
          ),
        ),
        AppSizedBox.sizeBoxH20,
        const HandelLoginState(),
      ],
    );
  }
}

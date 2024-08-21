import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/widgets/custom_buttons.dart';
import 'package:ayeenh/core/widgets/custom_text_form_field.dart';
import 'package:ayeenh/features/auth/prisintation/logic/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/app_statets.dart';
import 'handel_register_state.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'create_new_account'.tr(),
          style: AppStyles.titleStyle(),
        ),
        Text(
          'sub_title_register_body'.tr(),
          style: AppStyles.subTitleStyle(),
        ),
        AppSizedBox.sizeBoxH20,
        CustomTextFormField(
          controller: cubit.nameController,
          hint: 'name'.tr(),
        ),
        AppSizedBox.sizeBoxH10,
        CustomTextFormField(
          controller: cubit.phoneController,
          hint: 'phone'.tr(),
        ),
        AppSizedBox.sizeBoxH10,
        CustomTextFormField(
          controller: cubit.addressController,
          hint: 'address'.tr(),
        ),
        AppSizedBox.sizeBoxH10,
        CustomTextFormField(
          controller: cubit.ageController,
          hint: 'age'.tr(),
        ),
        AppSizedBox.sizeBoxH10,
        CustomTextFormField(
          controller: cubit.emailController,
          hint: 'email'.tr(),
        ),
        AppSizedBox.sizeBoxH10,
        CustomTextFormField(
          controller: cubit.passwordController,
          hint: 'password'.tr(),
        ),
        AppSizedBox.sizeBoxH20,
        const HandelRegisterState(),
      ],
    );
  }
}

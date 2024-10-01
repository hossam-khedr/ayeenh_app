import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';

import 'package:ayeenh/features/home/data/models/analysis_model.dart';

import 'package:ayeenh/features/user_request/domain/entities/request_uesr.dart';
import 'package:ayeenh/features/user_request/presentation/logic/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/helper_functions.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/main_app_scaffold.dart';
import '../widgets/request_date.dart';
import '../widgets/send_user_request.dart';

class UserRequestScreen extends StatefulWidget {
  final AnalysisModel model;

  const UserRequestScreen({
    super.key,
    required this.model,
  });

  @override
  State<UserRequestScreen> createState() => _UserRequestScreenState();
}

class _UserRequestScreenState extends State<UserRequestScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date = TextEditingController();

  // DateTime selectedDate = DateTime.now();

  void checkValueIsEmpty(String value) {
    if (value.isEmpty) {
      setState(() {});
      return;
    } else {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    name.addListener(() => checkValueIsEmpty(name.text));
    address.addListener(() => checkValueIsEmpty(address.text));
    phone.addListener(() => checkValueIsEmpty(phone.text));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RequestUserCubit>(context);
    return MainAppScaffold(
      shooAppBar: true,
      changeToolbarColor: true,
      centerAppBarTitle: true,
      appBarTitle: widget.model.name,
      appBarColor: AppColors.scaffoldBackGroundColor,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppSized.horizontalPaddingConst),
        child: ListView(
          children: [
            AppSizedBox.sizeBoxH80,
            Container(
              padding: EdgeInsets.all(20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.whitColor),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: name,
                    hint: 'name'.tr(),
                  ),
                  AppSizedBox.sizeBoxH10,
                  CustomTextFormField(
                    controller: address,
                    hint: 'address'.tr(),
                  ),
                  AppSizedBox.sizeBoxH10,
                  CustomTextFormField(
                    controller: phone,
                    hint: 'phone'.tr(),
                  ),
                  AppSizedBox.sizeBoxH10,
                  const RequestDate(),
                ],
              ),
            ),
            AppSizedBox.sizeBoxH40,
            name.text.isEmpty || address.text.isEmpty || phone.text.isEmpty
                ? Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'please_fill_in_the_data'.tr(),
                      style: AppStyles.errorStyle()
                          .copyWith(color: AppColors.warning, fontSize: 16.sp),
                    ),
                  )
                : SendUserRequest(
                    requestUser: RequestUser(
                      userName: name.text,
                      analysisType: widget.model.name,
                      dateTime:
                          HelperFunctions.formatDateTime(cubit.selectedDate!),
                      isStatus: false,
                      address: address.text,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

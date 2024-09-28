import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';

import 'package:ayeenh/features/home/data/models/analysis_model.dart';

import 'package:ayeenh/features/user_request/domain/entities/request_uesr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/helper_functions.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/main_app_scaffold.dart';
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
  DateTime selectedDate = DateTime.now();

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

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainAppScaffold(
      shooAppBar: true,
      changeToolbarColor: true,
      centerAppBarTitle: true,
      appBarTitle: widget.model.name,
      appBarColor: AppColors.whitColor,
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
                  color: AppColors.bluColor.withOpacity(0.2)),
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
                  CustomTextFormField(
                    readOnly: true,
                    controller: date,
                    hint: 'date'.tr(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _selectedDate(context);
                      },
                      child: const Icon(
                        Icons.date_range,
                        color: AppColors.bluColor,
                      ),
                    ),
                  ),
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
                      dateTime: HelperFunctions.formatDateTime(selectedDate),
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

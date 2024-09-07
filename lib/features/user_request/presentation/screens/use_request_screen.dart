import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:ayeenh/core/widgets/custom_buttons.dart';
import 'package:ayeenh/features/home/data/models/analysis_model.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/add_request_inpu_user.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/add_request_success.dart';
import 'package:ayeenh/features/user_request/domain/entities/request_uesr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/main_app_scaffold.dart';
import '../../../home/domain/entities/anlytics_category_model.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSizedBox.sizeBoxH20,
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
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SendUserRequest(
                requestUser: RequestUser(
                  userName: name.text,
                  analysisType: widget.model.name,
                  dateTime: selectedDate.toIso8601String(),
                  isStatus: false,
                  address: address.text,
                ),
              ),
              AppSizedBox.sizeBoxH10,
              CustomButtons.outLine(
                icon: Icons.cancel,
                iconColor: AppColors.favorite,
                title: 'cancel'.tr(),
                color: AppColors.whitColor,
                width: double.infinity,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

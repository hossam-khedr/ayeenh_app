import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/widgets/custom_buttons.dart';
import 'package:ayeenh/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddRequestInputUser extends StatefulWidget {
  const AddRequestInputUser({super.key});

  @override
  State<AddRequestInputUser> createState() => _AddRequestInputUserState();
}

class _AddRequestInputUserState extends State<AddRequestInputUser> {
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
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(15.w),
       // margin: EdgeInsets.all(10.w),
        height: 300.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.whitColor),
        child: Column(
         // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextFormField(
              controller: TextEditingController(),
              hint: 'name'.tr(),
            ),
            AppSizedBox.sizeBoxH10,
            CustomTextFormField(
              controller: TextEditingController(),
              hint: 'address'.tr(),
            ),
            AppSizedBox.sizeBoxH10,
           CustomTextFormField(
             controller: TextEditingController(),
             hint: 'phone'.tr(),
           ),
           AppSizedBox.sizeBoxH10,
           CustomTextFormField(
             readOnly: true,
             controller: TextEditingController(),
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
            AppSizedBox.sizeBoxH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtons.normal(
                  icon: Icons.done,
                  title: 'sure'.tr(),
                  color: AppColors.success,
                  width: 100.w,
                  onTap: () {
                    /// upload data request user to data base and call the payment method
                  },
                ),
                CustomButtons.outLine(
                  icon: Icons.cancel,
                  iconColor: AppColors.favorite,
                  title: 'cancel'.tr(),
                  color: AppColors.whitColor,
                  width: 100.w,
                  onTap: () {
                   Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

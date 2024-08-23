import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/app_colors.dart';
import '../utilities/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Widget? iconWidget;
  final IconData? iconData;
  final Color? iconColor;
  final Color? backGroundColor;
  final Widget? suffixIcon;
  final int? maxLines;
  bool? readOnly;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final TextInputType? keyboardType;
  final Function? onSaved;
  final Function? validator;
  bool obscureText;
  bool isPass;
  final Function()? onEditingComplete;

  CustomTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.iconWidget,
    this.iconData,
    this.iconColor,
    this.suffixIcon,
    this.textInputAction,
    this.autofillHints,
    this.keyboardType,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.isPass = false,
    this.readOnly = false,
    this.maxLines,
    this.onEditingComplete, this.backGroundColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
      decoration: InputDecoration(

        contentPadding: const EdgeInsets.fromLTRB(
          12,
          16,
          12,
          12,
        ),
        prefixIcon: widget.iconWidget != null
            ? Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 10,
            end: 1,
          ),
          child: widget.iconWidget!,
        )
            : (widget.iconData != null
            ? IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.iconData,
                color:
                widget.iconColor ?? AppColors.primaryColor,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 12.0),
                child: VerticalDivider(
                    thickness: 2,
                    color: widget.iconColor ??
                        AppColors.primaryColor),
              ),
            ],
          ),
        )
            : null),
        suffixIcon: widget.suffixIcon ??
            (widget.isPass
                ? InkWell(
              child: Icon(
                _visiblePassword
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.primaryColor,
                size: 17,
              ),
              onTap: () {
                setState(() {
                  _visiblePassword = !_visiblePassword;
                  widget.obscureText = !widget.obscureText;
                });
              },
            )
                : null),
        hintText: widget.hint,
        hintStyle: AppStyles.hintStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSized.constantRadius),
            borderSide: const BorderSide(
              color: AppColors.gryColor,
              width: 1,
            )
        ),
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSized.constantRadius),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1.5,
            )
        ),
        border: InputBorder.none,
      ),
      textInputAction: widget.textInputAction,
      onEditingComplete: widget.onEditingComplete,
      autofillHints: widget.autofillHints,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      onSaved: widget.onSaved as void Function(String?)?,
      validator: widget.validator as String? Function(String?)?,
      obscureText: widget.obscureText,
    );
  }
}

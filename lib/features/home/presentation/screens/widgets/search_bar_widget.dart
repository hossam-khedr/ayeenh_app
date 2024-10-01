import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/cubit.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  const SearchBarWidget({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: searchController,
      hint: 'search'.tr(),
      iconWidget: const Icon(
        Icons.search,
        color: AppColors.bluColor,
      ),
      onChanged: (value) {
        context.read<HomeCubit>().searchOnAnalysis(searchController.text);

      },
    );
  }
}

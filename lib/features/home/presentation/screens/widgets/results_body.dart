import 'package:ayeenh/core/utilities/app_states/full_screen_empty_state.dart';
import 'package:ayeenh/core/widgets/custom_dialog.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/result_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';

class ResultsBody extends StatefulWidget {
  const ResultsBody({super.key});

  @override
  State<ResultsBody> createState() => _ResultsBodyState();
}

class _ResultsBodyState extends State<ResultsBody> {
  @override
  Widget build(BuildContext context) {
  return ListView.separated(
    padding: EdgeInsets.all(10.w),
    separatorBuilder: (context,index)=> const Divider(color: AppColors.warning,),
    itemCount: 5,
      itemBuilder: (context,index){
    return const ResultItem();
  });
  }

}
//FullScreenEmptyState(message: 'no_results_yet'.tr(),)
import 'package:ayeenh/core/utilities/app_states/full_screen_empty_state.dart';
import 'package:ayeenh/core/widgets/custom_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResultsBody extends StatefulWidget {
  const ResultsBody({super.key});

  @override
  State<ResultsBody> createState() => _ResultsBodyState();
}

class _ResultsBodyState extends State<ResultsBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FullScreenEmptyState(message: 'no_results_yet'.tr(),)
    );
  }
}

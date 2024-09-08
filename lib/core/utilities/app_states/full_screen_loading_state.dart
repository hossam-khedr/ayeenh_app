import 'package:flutter/cupertino.dart';

import '../app_colors.dart';

class FullScreenLoadingState extends StatelessWidget {
  const FullScreenLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: AppColors.bluColor,
        radius: 20,
      ),
    );
  }
}

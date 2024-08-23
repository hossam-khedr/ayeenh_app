import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/app_statets.dart';
import '../../../../core/utilities/di.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../logic/cubit.dart';
import '../logic/states.dart';

class HandelRegisterState extends StatelessWidget {
  const HandelRegisterState({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AuthCubit>();
    return BlocProvider.value(
      value: cubit,
      child: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state.isLoading) {
            showDialog(
                context: context,
                builder: (context) => const PobUpLoadingState());
          }
          if (state.isFailure) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) =>
                  PobUpErrorState(errorMassage: state.errorMassage!),
            );
          }
        },
        child: CustomButtons.normal(
          title: 'create_new_account'.tr(),
          onTap: () {
            cubit.register();
          },
        ),
      ),
    );
  }
}

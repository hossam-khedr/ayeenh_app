import 'package:ayeenh/core/utilities/app_routes.dart';
import 'package:ayeenh/features/auth/auth_di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utilities/app_states/pob_up_error_state.dart';
import '../../../../core/utilities/app_states/pob_up_loading_state.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../logic/cubit.dart';
import '../logic/states.dart';

class HandelRegisterState extends StatelessWidget {
  const HandelRegisterState({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
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
          if(state.isSuccess){
            context.go(RoutesName.home);
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

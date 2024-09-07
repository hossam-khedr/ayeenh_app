import 'package:ayeenh/core/utilities/app_routes.dart';
import 'package:ayeenh/features/auth/auth_di.dart';
import 'package:ayeenh/features/auth/prisintation/logic/cubit.dart';
import 'package:ayeenh/features/auth/prisintation/logic/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_buttons.dart';

class HandelLoginState extends StatelessWidget {
  const HandelLoginState({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = authDi<AuthCubit>();
    return BlocProvider.value(
      value: cubit,
      child: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          // if (state.isLoading) {
          //   showDialog(
          //       context: context,
          //       builder: (context) => const PobUpLoadingState());
          // }
          // if (state.isFailure) {
          //   Navigator.pop(context);
          //   showDialog(
          //     context: context,
          //     builder: (context) =>
          //         PobUpErrorState(errorMassage: state.errorMassage!),
          //   );
          // }
        },
        child: CustomButtons.normal(
          title: 'login'.tr(),
          onTap: () {
           // cubit.login();
            context.go(RoutesName.home);
          },
        ),
      ),
    );
  }
}

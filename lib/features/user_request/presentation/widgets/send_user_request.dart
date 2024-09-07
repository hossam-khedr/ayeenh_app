import 'package:ayeenh/core/utilities/app_statets.dart';
import 'package:ayeenh/features/user_request/presentation/logic/cubit.dart';
import 'package:ayeenh/features/user_request/presentation/logic/states.dart';
import 'package:ayeenh/features/user_request/user_request_di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../../../home/presentation/screens/widgets/add_request_success.dart';
import '../../domain/entities/request_uesr.dart';

class SendUserRequest extends StatefulWidget {
  final RequestUser requestUser;
  const SendUserRequest({super.key, required this.requestUser});

  @override
  State<SendUserRequest> createState() => _SendUserRequestState();
}

class _SendUserRequestState extends State<SendUserRequest> {
  final cubit = requestDi<RequestUserCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child:BlocListener<RequestUserCubit,RequestUserStates>(
        // listenWhen: (curent,proi){
        //   return curent =
        // },
        listener: (context,stat){
          if(stat.isLoading){
            showDialog(context: context, builder: (context)=>const PobUpLoadingState());
          }
          if(stat.isFailure){
            Navigator.pop(context);
            showDialog(context: context, builder: (context)=>PobUpErrorState(errorMassage: stat.errorMassage!));
          }
          if(stat.isSuccess){
            Navigator.pop(context);
            showModalBottomSheet(
              context: context,
              builder: (context) => const AddRequestSuccess(),
            );
          }
        },
        child: CustomButtons.normal(
          icon: Icons.done,
          title: 'sure'.tr(),
          color: AppColors.success,
          width: double.infinity,
          onTap: () {
            /// upload data request user to data base and call the payment method
            context.read<RequestUserCubit>().sendUserRequest(widget.requestUser);
          }
        ),
      ) ,
    );
  }
}

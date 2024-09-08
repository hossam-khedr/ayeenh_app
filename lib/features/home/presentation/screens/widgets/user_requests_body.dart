import 'package:ayeenh/core/utilities/app_states/full_screen_empty_state.dart';
import 'package:ayeenh/features/home/domain/entities/request_model.dart';
import 'package:ayeenh/features/home/presentation/logic/cubit.dart';
import 'package:ayeenh/features/home/presentation/logic/state.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/user_request_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/app_states/full_screen_loading_state.dart';

class UserRequestsBody extends StatefulWidget {
  const UserRequestsBody({super.key});

  @override
  State<UserRequestsBody> createState() => _UserRequestsBodyState();
}

class _UserRequestsBodyState extends State<UserRequestsBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      if (state.isLoading) {
        return const FullScreenLoadingState();
      }
      if (state.isFailure) {
        return Center(
          child: Text(state.errorMassage!),
        );
      } else {
        if (state.requests.isEmpty) {
          return FullScreenEmptyState(
            message: 'no_requests_yet'.tr(),
          );
        }
        return ListView.separated(
          itemCount: state.requests.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return UserRequestItem(
              userRequestModel: state.requests[index],
            );
          },
        );
      }
    });
  }
}

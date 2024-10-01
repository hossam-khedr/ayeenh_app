import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/app_states/full_screen_empty_state.dart';
import 'package:ayeenh/core/widgets/custom_text_form_field.dart';
import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:ayeenh/features/chat_pot/presentation/logic/cubit.dart';
import 'package:ayeenh/features/chat_pot/presentation/logic/states.dart';
import 'package:ayeenh/features/chat_pot/presentation/screens/widgets/massage_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BotScreen extends StatefulWidget {
  const BotScreen({super.key});

  @override
  State<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BotCubit>(context);
    return MainAppScaffold(
      scaffoldColor: AppColors.whitColor,
      centerAppBarTitle: true,
      appBarColor: AppColors.whitColor,
      appBarTitle: 'want_to_know_about_analysis'.tr(),
      body: Column(
        children: [
          AppSizedBox.sizeBoxH20,
          BlocBuilder<BotCubit, BotStates>(builder: (context, state) {
            
            return Expanded(
              child:cubit.massages.isEmpty?
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: FullScreenEmptyState(message: 'hint_bot_massage'.tr()),
                   )
                  : ListView.separated(
                padding: EdgeInsets.all(10.w),
                itemCount: cubit.massages.length,
                separatorBuilder: (context, index) => AppSizedBox.sizeBoxH20,
                itemBuilder: (context, index) => MassageItem(
                  massageModel: cubit.massages[index],
                ),
              ),
            );
          }),
          BlocBuilder<BotCubit, BotStates>(builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  state.isLoading
                      ? const CircularProgressIndicator(
                          color: AppColors.warning,
                        )
                      : Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.warning),
                          height: 50.h,
                          width: 50.w,
                          child: InkWell(
                            onTap: () {
                              cubit.sendMassage();
                            },
                            child: const Icon(
                              Icons.send_outlined,
                              color: AppColors.whitColor,
                            ),
                          ),
                        ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextFormField(
                        controller: cubit.userMessageController,
                        hint: 'type_here'.tr()),
                  ),
                ],
              ),
            );
          }),
          AppSizedBox.sizeBoxH20
        ],
      ),
    );
  }
}

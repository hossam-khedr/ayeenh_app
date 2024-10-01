import 'package:ayeenh/core/utilities/app_routes.dart';
import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/enums.dart';
import 'package:ayeenh/core/utilities/svg_icons.dart';
import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:ayeenh/features/app_utils/presentation/screens/settings_screen.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/analysis_body.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/custom_nav_bar.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/item_in_nav_bar.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/results_body.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/settings_body.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/user_requests_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_states/full_screen_empty_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NavBarItem navBarItem = NavBarItem.home;

  @override
  Widget build(BuildContext context) {
    return MainAppScaffold(
      shooAppBar: false,
      changeToolbarColor: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              end: AppSized.horizontalPaddingConst,
              start: AppSized.horizontalPaddingConst,
              top: 15.h),
          child: Column(
            children: [
              Expanded(
                child: navBarItem == NavBarItem.home
                    ? Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: const AnalysisBody(),
                      )
                    : navBarItem == NavBarItem.results
                        ? const Center(child: ResultsBody())
                        : navBarItem == NavBarItem.request
                            ? Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: const UserRequestsBody(),
                              )
                            : navBarItem == NavBarItem.setting
                                ? Padding(
                                    padding: EdgeInsets.all(8.0.w),
                                    child: const SettingsBody(),
                                  )
                                : const SizedBox.shrink(),
              ),
              // const Spacer(),
              // AppSizedBox.sizeBoxH20,
              CustomNavBar(
                itemsInNavBar: [
                  ItemInNavBar(
                    iconPath: SvgIcons.allAnalysisIcon,
                    isSelected: navBarItem == NavBarItem.home ? true : false,
                    label: 'analysis'.tr(),
                    onTap: () {
                      setState(() {
                        navBarItem = NavBarItem.home;
                      });
                    },
                  ),
                  ItemInNavBar(
                    iconPath: SvgIcons.resultsIcon,
                    isSelected: navBarItem == NavBarItem.results ? true : false,
                    label: 'results'.tr(),
                    onTap: () {
                      setState(() {
                        navBarItem = NavBarItem.results;
                      });
                    },
                  ),
                  ItemInNavBar(
                    iconPath: SvgIcons.requestsIcon,
                    isSelected: navBarItem == NavBarItem.request ? true : false,
                    label: 'user_requests'.tr(),
                    onTap: () {
                      setState(() {
                        navBarItem = NavBarItem.request;
                      });
                    },
                  ),
                  ItemInNavBar(
                    iconPath: '',
                    isSelected: navBarItem == NavBarItem.setting ? true : false,
                    label: 'settings'.tr(),
                    onTap: () {
                      setState(() {
                        navBarItem = NavBarItem.setting;
                      });
                    },
                  ),
                ],
              ),
              AppSizedBox.sizeBoxH10,
            ],
          ),
        ),
      ),
    );
  }
}

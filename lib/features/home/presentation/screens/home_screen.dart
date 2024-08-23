import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/enums.dart';
import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/analysis_body.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/custom_nav_bar.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/item_in_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
      changeToolbarColor: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSized.horizontalPaddingConst,
          ),
          child: Column(
            children: [
              Expanded(
                child: navBarItem == NavBarItem.home
                    ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AnalysisBody(),
                    )
                    : navBarItem == NavBarItem.results
                        ? Center(child: Text('results'.tr()))
                        : navBarItem == NavBarItem.setting
                            ? Center(child: Text('settings'.tr()))
                            : const SizedBox.shrink(),
              ),
             // const Spacer(),
              // AppSizedBox.sizeBoxH20,
              CustomNavBar(
                itemsInNavBar: [
                  ItemInNavBar(
                    icon: Icons.analytics_outlined,
                    isSelected: navBarItem == NavBarItem.home ? true : false,
                    label: 'analysis'.tr(),
                    onTap: () {
                      setState(() {
                        navBarItem = NavBarItem.home;
                      });
                    },
                  ),
                  ItemInNavBar(
                    icon: Icons.receipt_sharp,
                    isSelected: navBarItem == NavBarItem.results ? true : false,
                    label: 'results'.tr(),
                    onTap: () {
                      setState(() {
                        navBarItem = NavBarItem.results;
                      });
                    },
                  ),
                  ItemInNavBar(
                    icon: Icons.settings,
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

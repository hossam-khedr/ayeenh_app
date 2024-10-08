import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/app_colors.dart';

class MainAppScaffold extends StatefulWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final bool shooAppBar;
  final List<Widget>? actions;
  final String? appBarTitle;
  final Color? scaffoldColor;
  final Color? appBarColor;
  final bool? centerAppBarTitle;
  final bool changeToolbarColor;
  final bool? shooBackIcon;
  final Widget? bottomNavigationBar;

  const MainAppScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.shooAppBar = true,
    this.appBarTitle,
    this.scaffoldColor,
    this.centerAppBarTitle = true,
    this.shooBackIcon = true,
    this.bottomNavigationBar,
    this.changeToolbarColor = false,
    this.appBarColor, this.actions,
  });

  @override
  State<MainAppScaffold> createState() => _MainAppScaffoldState();
}

class _MainAppScaffoldState extends State<MainAppScaffold> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(
        widget.appBarTitle ?? '',
        style: AppStyles.titleStyle().copyWith(
          fontSize: 16.sp
        ),
      ),
      centerTitle: widget.centerAppBarTitle,
      elevation: 0,
      backgroundColor: widget.appBarColor ?? AppColors.whitColor,
      actions:widget.actions?? [],
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: widget.changeToolbarColor
            ? AppColors.primaryColor
            : AppColors.scaffoldBackGroundColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: widget.scaffoldColor ?? AppColors.scaffoldBackGroundColor,
        appBar: widget.shooAppBar ? appBar : null,
        body: Stack(
          children: [widget.body],
        ),
        floatingActionButton: widget.floatingActionButton,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}

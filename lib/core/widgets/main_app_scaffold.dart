import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainAppScaffold extends StatefulWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final bool shooAppBar;
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
    this.appBarColor,
  });

  @override
  State<MainAppScaffold> createState() => _MainAppScaffoldState();
}

class _MainAppScaffoldState extends State<MainAppScaffold> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(widget.appBarTitle ?? ''),
      centerTitle: widget.centerAppBarTitle,
      elevation: 0,
      backgroundColor: widget.appBarColor ?? Colors.white,
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor:
            widget.changeToolbarColor ? Colors.redAccent : Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: widget.scaffoldColor ?? Colors.white,
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

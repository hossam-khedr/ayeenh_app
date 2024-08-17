import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MainAppScaffold(
      shooAppBar: false,
      appBarColor: Colors.redAccent,
      body: Column(),
    );
  }
}

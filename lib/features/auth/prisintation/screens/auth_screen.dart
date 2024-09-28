import 'package:ayeenh/core/utilities/app_colors.dart';
import 'package:ayeenh/core/utilities/app_sized.dart';
import 'package:ayeenh/core/utilities/app_sized_box.dart';
import 'package:ayeenh/core/utilities/enums.dart';
import 'package:ayeenh/core/utilities/svg_icons.dart';
import 'package:ayeenh/core/widgets/main_app_scaffold.dart';
import 'package:ayeenh/features/auth/prisintation/widgets/login_body.dart';
import 'package:ayeenh/features/auth/prisintation/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/login_or_register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthType authType = AuthType.login;

  @override
  Widget build(BuildContext context) {
    return MainAppScaffold(
      shooAppBar: false,
      changeToolbarColor: false,
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppSized.horizontalPaddingConst),
        child: Column(
          children: [
            AppSizedBox.sizeBoxH20,
            Align(
                alignment: AlignmentDirectional.topCenter,
                child: SvgPicture.asset(
                  SvgIcons.appLogoIcon,
                  color: AppColors.bluColor,
                  height: 100.h,
                )),
            AppSizedBox.sizeBoxH40,
            LoginOrRegister(
              authType: authType,
              loginOnTap: () {
                authType = AuthType.login;
                setState(() {});
              },
              registerOnTap: () {
                authType = AuthType.register;
                setState(() {});
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  AppSizedBox.sizeBoxH20,
                  authType == AuthType.login
                      ? const LoginBody()
                      : const RegisterBody(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

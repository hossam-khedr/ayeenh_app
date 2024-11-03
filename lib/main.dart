import 'package:ayeenh/ayeenh_app.dart';
import 'package:ayeenh/core/utilities/app_constants.dart';
import 'package:ayeenh/core/utilities/cach_helper.dart';
import 'package:ayeenh/core/utilities/helper_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:error_stack/error_stack.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/utilities/injection_container.dart';
import 'firebase_options.dart';

void main() async {
 await HelperFunctions.initializeApp();
final language =  HelperFunctions.getAppLanguage();
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  // await CacheHelper.initShardPreferences();
  // final language =  HelperFunctions.getAppLanguage();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await InjectionContainer().initSl();
  // await ErrorStack.init();
  runApp(
    EasyLocalization(
      path: 'assets/i18n',
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      startLocale: language=='english'
          ? const Locale('en', 'US')
          : const Locale('ar', 'SA'),
      child: const AyeenhApp(),
    ),
  );
}

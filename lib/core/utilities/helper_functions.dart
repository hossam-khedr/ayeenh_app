import 'package:easy_localization/easy_localization.dart';
import 'package:error_stack/error_stack.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../firebase_options.dart';
import 'app_constants.dart';
import 'cach_helper.dart';
import 'injection_container.dart';

abstract class HelperFunctions {
  static String formatDateTime(DateTime now) {
    String formatDate = DateFormat('dd/MM/yyyy').format(now);
    return formatDate;
  }

  static String formatTime(DateTime now) {
    String formatDate = DateFormat.jm().format(now);
    return formatDate;
  }

  static getAppLanguage() {
    if (AppConstants.languageKey.isNotEmpty) {
      return CacheHelper.getString(AppConstants.languageKey);
    }
  }
  static getOnBoardingStatus() {
    if (AppConstants.onBoardingViews.isNotEmpty) {
      return CacheHelper.getString(AppConstants.onBoardingViews);
    }
  }
  static Future<void>initializeApp()async{
    try{
      WidgetsFlutterBinding.ensureInitialized();
      await Future.wait([
       EasyLocalization.ensureInitialized(),
       CacheHelper.initShardPreferences(),
        Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    ),
     InjectionContainer().initSl(),
      ]);
     await ErrorStack.init();
      debugPrint('APP IS STARTED');
    }catch(error){
      debugPrint('CATCH ERROR INITIALIZE APP ${error.toString()}');
    }
  }
}

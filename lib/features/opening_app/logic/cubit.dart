import 'dart:async';

import 'package:ayeenh/core/utilities/cach_helper.dart';
import 'package:ayeenh/core/utilities/enums.dart';
import 'package:ayeenh/core/utilities/helper_functions.dart';
import 'package:ayeenh/features/opening_app/logic/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utilities/app_constants.dart';

class OpeningCubit extends Cubit<OpeningStates> {
  OpeningCubit() : super(OpeningStates());
  late Timer _timer;

  Locale selectLanguage(LanguageType languageType) {
    Map<LanguageType, Locale> locales = {
      LanguageType.arabic: const Locale('ar', 'SA'),
      LanguageType.english: const Locale('en', 'US'),
    };
    CacheHelper.saveData(AppConstants.languageKey, languageType.name);
    emit(state.copyWith(openingStatus: OpeningStatus.selectedLangSuccess));
    debugPrint('SET LOCAL=> ${languageType.name}');

    return locales[languageType] ?? const Locale('en', 'US');
  }

  void skipOnBoarding() {
    CacheHelper.saveData(AppConstants.onBoardingViews, state.isOnBoardingViews);
    emit(state.copyWith(
      openingStatus: OpeningStatus.onBoardingViewsSuccess,
      isOnBoardingViews: true,
    ));
    debugPrint('SKIP ONBOARDING SUCCESS');
  }

  void initSplash() {
    _timer = Timer(
      const Duration(seconds: 3),
      () {
        try {
          debugPrint('Start Splash');
          if (state.isOnBoardingViews == true) {
            final onBoardingStatus = HelperFunctions.getOnBoardingStatus();
            if (onBoardingStatus) {
              emit(state.copyWith(
                  openingStatus: OpeningStatus.onBoardingViewsSuccess,
                  isOnBoardingViews: true));
            }
          }

          if (state.isSelectedLanguage == true) {
            final language = HelperFunctions.getAppLanguage();
            if (language != null) {
              emit(
                state.copyWith(
                    openingStatus: OpeningStatus.selectedLangSuccess,
                    isSelectedLanguage: true),
              );
            } else {
              emit(state.copyWith(
                openingStatus: OpeningStatus.unSelectedLang,
                isSelectedLanguage: false,
              ));
            }
          }
        } catch (error) {
          debugPrint(error.toString());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}

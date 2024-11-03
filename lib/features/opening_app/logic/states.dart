import 'dart:async';

enum OpeningStatus {
  init,
  selectedLangSuccess,
  unSelectedLang,
  onBoardingViewsSuccess,
}

extension OpeningStatesExtension on OpeningStates {
  bool get isInit => openingStatus == OpeningStatus.init;

  bool get isSelectedLangSuccess =>
      openingStatus == OpeningStatus.selectedLangSuccess;
  bool get isUnSelectedLangSuccess =>
      openingStatus == OpeningStatus.unSelectedLang;

  bool get isOnBoardingViewsSuccess =>
      openingStatus == OpeningStatus.onBoardingViewsSuccess;
}

class OpeningStates {
  OpeningStatus openingStatus;
 late bool isOnBoardingViews;
 late bool isSelectedLanguage;


  OpeningStates(
      {this.openingStatus = OpeningStatus.init,
      this.isOnBoardingViews = false,
      this.isSelectedLanguage = false,
    });

  OpeningStates copyWith({
    OpeningStatus? openingStatus,
    bool? isOnBoardingViews,
    bool? isSelectedLanguage,
  }) {
    return OpeningStates(
      openingStatus: openingStatus ?? this.openingStatus,
      isOnBoardingViews: isOnBoardingViews ?? this.isOnBoardingViews,
      isSelectedLanguage: isSelectedLanguage ?? this.isSelectedLanguage,
    );
  }
}

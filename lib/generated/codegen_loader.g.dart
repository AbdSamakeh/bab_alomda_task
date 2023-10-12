// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "newsFeature": "-------------- News Feature Translation Section ------------------",
  "otherFeature": "-------------- Global Translation ------------------",
  "mobileData": "Mobile Data",
  "wifi": "Wifi",
  "pleaseCheckYourInternetConnection": "Please check your internet connection",
  "pleaseTurnOnWifiOrMobileData": "Please turn on wifi or mobile data on",
  "refresh": "Refresh",
  "seeAll": "See all",
  "search": "Search",
  "filter": "Filter",
  "errorsTranslation": "-------------- Errors Translation ------------------",
  "thereIsNoCachedData": "There is no cached data",
  "someThingWentWrong": "Something went wrong",
  "serverError": "Server Error"
};
static const Map<String,dynamic> ar = {
  "newsFeature": "-------------- ترجمة القسم الخاص ميزة الأخبار ------------------",
  "otherFeature": "-------------- قسم الترجمة العام في التطبيث ------------------",
  "mobileData": "بيانات الهاتف",
  "wifi": "لاسلكي",
  "pleaseCheckYourInternetConnection": "الرجاء التحقق من اتصال الانترنت الخاص بك",
  "pleaseTurnOnWifiOrMobileData": "يرجى تشغيل لاسلكي أو تشغيل بيانات الهاتف",
  "refresh": "تحديث",
  "seeAll": "رؤية الجميع",
  "search": "بحث",
  "filter": "تنقية",
  "errorsTranslation": "-------------- قسم ترجمة الأخطاء  ------------------",
  "thereIsNoCachedData": "لا توجد بيانات مخزنة",
  "someThingWentWrong": "حدث خطأ ما",
  "serverError": "حدث خطأ في الخادم"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}

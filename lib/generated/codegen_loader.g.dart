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
  "noResultsFound": "No Results Found",
  "all": "All",
  "otherFeature": "-------------- Global Translation ------------------",
  "mobileData": "Mobile Data",
  "wifi": "Wifi",
  "nytNews": "NYT News",
  "pleaseCheckYourInternetConnection": "Please check your internet connection",
  "pleaseTurnOnWifiOrMobileData": "Please turn on wifi or mobile data on",
  "refresh": "Refresh",
  "seeAll": "See all",
  "search": "Search",
  "filter": "Filter",
  "version": "Version",
  "lightMode": "Light Mode",
  "darkMode": "Dark Mode",
  "errorsTranslation": "-------------- Errors Translation ------------------",
  "thereIsNoCachedData": "There is no cached data",
  "someThingWentWrong": "Something went wrong",
  "serverError": "Server Error"
};
static const Map<String,dynamic> ar = {
  "newsFeature": "-------------- ترجمة القسم الخاص ميزة الأخبار ------------------",
  "noResultsFound": "عذرا لا يوجد نتائج",
  "all": "الكل",
  "otherFeature": "-------------- قسم الترجمة العام في التطبيث ------------------",
  "mobileData": "بيانات الهاتف",
  "wifi": "لاسلكي",
  "nytNews": "أخبار نيويورك تايمز",
  "pleaseCheckYourInternetConnection": "الرجاء التحقق من اتصال الانترنت الخاص بك",
  "pleaseTurnOnWifiOrMobileData": "يرجى تشغيل لاسلكي أو تشغيل بيانات الهاتف",
  "refresh": "تحديث",
  "seeAll": "رؤية الجميع",
  "search": "بحث",
  "filter": "تنقية",
  "version": "النسسخة",
  "lightMode": "وضع الفاتح",
  "darkMode": "الوضع الداكن",
  "errorsTranslation": "-------------- قسم ترجمة الأخطاء  ------------------",
  "thereIsNoCachedData": "لا توجد بيانات مخزنة",
  "someThingWentWrong": "حدث خطأ ما",
  "serverError": "حدث خطأ في الخادم"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}

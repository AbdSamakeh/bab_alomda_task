// ignore_for_file: file_names
import 'package:shared_preferences/shared_preferences.dart';

import '../../resource/key_manger.dart';

class AppSharedPreferences {
  static late SharedPreferences _sharedPreferences;
  //!Initilize Functions
  //Initilize local memorey using shared preference
  static init(SharedPreferences sh) {
    _sharedPreferences = sh;
  }

  //Clear cached data in local memorey
  static clear() {
    _sharedPreferences.clear();
  }

  //!Cache Functions
  //Cache languge in local memorey
  static cashLanguage({required String language}) {
    _sharedPreferences.setString(AppKeyManger.language, language);
  }

  //Cache Theme Mode in local memorey
  static cashTheme({required bool isLight}) {
    _sharedPreferences.setBool(AppKeyManger.themeModeLocalKey, isLight);
  }

  //!Get Functions
  // Get cached Language in local memorey and set the deafult langauge is English if it's null
  static String getLanguage() {
    return _sharedPreferences.getString(AppKeyManger.language) ?? "en";
  }

  // Get cached Theme Mode in local memorey and set the deafult Mode is Light if it's null
  static bool getCashedThemeMode() {
    return _sharedPreferences.getBool(AppKeyManger.themeModeLocalKey) ?? true;
  }
}

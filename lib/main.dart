import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/resource/constant_manager.dart';
import 'core/resource/key_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/my_app.dart';
import 'core/storage/shared/shared_pref.dart';
import 'core/injection/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //! Easy Localizarion Initilization
  await EasyLocalization.ensureInitialized();
  //! Dependacy Injection Box Initilization
  await di.init();
  //! Run App
  //Shared Preferences Initilization
  SharedPreferences.getInstance().then(
    (prefs) {
      AppSharedPreferences.init(prefs);
      runApp(
        //Supported Locals (ar,en)
        EasyLocalization(
          supportedLocales: const [
            //Ar Local
            Locale(
              AppKeyManger.arabicLocalizationCode,
            ),
            //En Local
            Locale(
              AppKeyManger.englishLocalizationCode,
            ),
          ],
          path: AppConstantManager.assetTranslationPath,
          fallbackLocale: const Locale(
            AppKeyManger.englishLocalizationCode,
          ),
          child: const MyApp(),
        ),
      );
    },
  );
}
